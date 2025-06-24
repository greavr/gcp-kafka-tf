provider "google" {
  # Credentials sourced automatically
  project = var.project_id
}

provider "google-beta" {
  # Credentials sourced automatically
  project = var.project_id
}
