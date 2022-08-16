resource "google_compute_router" "router" {
  project = "${var.project}"
  name    = "${var.name}"
  region  = "${var.region}"
  network = google_compute_network.main.id
}
