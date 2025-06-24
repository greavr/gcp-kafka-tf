# ----------------------------------------------------------------------------------------------------------------------
# VPC Resources
# ----------------------------------------------------------------------------------------------------------------------
# Create VPC Network for each region
resource "google_compute_network" "vpc_network" {
  project      = var.project_id
  
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = false # We will create custom subnets
  mtu                     = 1460  # Standard MTU

  depends_on = [google_project_service.apis]
}

resource "google_compute_subnetwork" "subnet" {
  project                  = var.project_id
  count                    = length(var.gcp_regions)
  name                     = "${var.gcp_regions[count.index]}-subnet"
  ip_cidr_range            = cidrsubnet("10.0.0.0/16", 8, count.index) # Assign non-overlapping /24 ranges like 10.0.0.0/24, 10.0.1.0/24 etc.
  region                   = var.gcp_regions[count.index]
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true # Allows VMs without external IPs to reach Google APIs

  description = "Subnet for ${var.gcp_regions[count.index]} in ${google_compute_network.vpc_network.name}"

  depends_on = [google_compute_network.vpc_network]
}