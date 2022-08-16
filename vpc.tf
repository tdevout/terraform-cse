resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  project = "${var.project}"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
  project = "${var.project}"
}


resource "google_compute_network" "main" {
  
  project                         = "${var.project}"
  name                            = "${var.name}-vpc"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}

resource "google_compute_subnetwork" "private" {
  project = "${var.project}"
  name                     = "${var.name}-private"
  ip_cidr_range            = "10.0.0.0/18"
  region                   = "${var.region}"
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}