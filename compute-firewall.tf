resource "google_compute_firewall" "cse-ssh" {
  project = "${var.project}"
  name    = "${var.name}-ssh"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = "${var.ports}"
    
  }

  source_ranges = ["0.0.0.0/0"]

}
