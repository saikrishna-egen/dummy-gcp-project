provider "google" {
  project = "dummy-test-project-123"
  region  = "us-central1"
}

# Enables the Compute Engine API
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

# Deploys a Cloud Run service 
resource "google_cloud_run_v2_service" "default" {
  name     = "dummy-cloudrun-service"
  location = "us-central1"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    }
  }
}