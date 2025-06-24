# ----------------------------------------------------------------------------------------------------------------------
# Kafka Resources
# ----------------------------------------------------------------------------------------------------------------------
# Kafka Cluster
resource "google_managed_kafka_cluster" "main_kafka_cluster" {
    for_each =  toset(var.gcp_regions)

    cluster_id      = "${each.key}-${var.kafka_cluster_name}"
    location        = each.key
    project         = var.project_id
    
    capacity_config {
        vcpu_count   = var.kafka_min_vcpu
        memory_bytes = var.kafka_min_ram    
    }
    
    gcp_config {
        access_config {
            network_configs {
               subnet ="projects/${data.google_project.project.number}/regions/${each.key}/subnetworks/${each.key}-subnet"
            }
        }
    }

    rebalance_config {
        mode = "AUTO_REBALANCE_ON_SCALE_UP"
    }

    labels = {
        environment = "dev"
        managed_by  = "terraform"
    }

    depends_on = [
        google_compute_subnetwork.subnet
    ]
}

# Kafka SA
resource "google_service_account" "kafka_client_service_account" {
    account_id   = var.service_account_id
    display_name = "Service Account for GCP Managed Kafka Clients"
    project      = var.project_id
}

# Kafka SA Roles
resource "google_project_iam_member" "service_account-roles" {
    for_each = toset(var.kafka_sa_roles)
    role    = "roles/${each.value}"
    member  = "serviceAccount:${google_service_account.kafka_client_service_account.email}"
    project = var.project_id
    
    
    depends_on = [
        google_service_account.kafka_client_service_account
        ]
}