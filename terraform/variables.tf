# ----------------------------------------------------------------------------------------------------------------------
# Base Variables
# ----------------------------------------------------------------------------------------------------------------------
# GCP Project Name
variable "project_id" {
    type = string
}

# ----------------------------------------------------------------------------------------------------------------------
# Project Variables
# ----------------------------------------------------------------------------------------------------------------------
# Regions to deploy Kafka cluster
variable "gcp_regions" {
  description = "Map of regions where resources will be deployed."
  type        = list(string)
  default     = ["us-west1"]
}

# Create Subnetwork in each VPC/Region
locals {
  region_indices = { for i, region in var.gcp_regions : region => i }
}


# Enable required APIs for the project
variable "services_to_enable" {
  description = "Services To Be Enabled"
  type        = list(string)
  default   =[
    "compute.googleapis.com",
    "storage-component.googleapis.com",
    "storage-api.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "stackdriver.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "servicenetworking.googleapis.com",
    "managedkafka.googleapis.com"
  ]
}

# ----------------------------------------------------------------------------------------------------------------------
# Kafka Variables
# ----------------------------------------------------------------------------------------------------------------------
# Kafka Cluster Name
variable "kafka_cluster_name" {
  description = "Kafka Cluster Name"
  type        = string
  default     = "testing-cluster"
}
# Kafka Producer / Consumer SA
variable "service_account_id" {
  description = "ID for the custom service account for Kafka clients (if needed for producers/consumers)"
  type        = string
  default     = "kafka-client-sa"
}

# Kafka SA Roles
variable "kafka_sa_roles" {
    description = "Kafka Service Account Roles"
    type        = list(string)
    default     = [
        "managedkafka.client"
    ]
}

# Kafka vCPU Count
variable "kafka_min_vcpu" {
    description = "Minimum vCPU, minimum is 3"
    type = number
    default = 3
}

variable "kafka_min_ram" {
    description = "he memory to provision for the cluster in bytes. The value must be between 1 GiB and 8 GiB per vCPU. Ex. 1024Mi, 4Gi."
    type = number
    default = 3221225472
}