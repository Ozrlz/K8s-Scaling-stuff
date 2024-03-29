resource "google_container_cluster" "cluster" {
  name                     = "${var.cluster-name}"
  project                  = "${var.project-id}"
  location                 = "${var.location}"
  remove_default_node_pool = true
  initial_node_count       = "${var.nodepools-init-size}"
}

resource "google_container_node_pool" "node_pool" {
  name     = "main-pool"
  project  = "${var.project-id}"
  location = "${var.location}"
  cluster  = "${google_container_cluster.cluster.name}"

  initial_node_count = "${var.nodepools-init-size}"
  autoscaling {
    min_node_count = "${var.autoscaling_min_size}"
    max_node_count = "${var.autoscaling_max_size}"
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    image_type   = "${var.image_type}"
    machine_type = "${var.machine_type}"
  }
}
