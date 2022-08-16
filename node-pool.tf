resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
  project = "${var.project}"
}

resource "google_container_node_pool" "general" {
  name       = "general"
  cluster    = google_container_cluster.cse.id
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = "${var.machine}"

    labels = {
      role = "general"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

