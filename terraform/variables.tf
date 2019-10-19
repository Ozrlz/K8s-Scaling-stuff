variable "location" {
  default = "us-central1"
}

variable "cluster-name" {
  default = "metrics-test"
}

variable "nodepools-init-size" {
  default = "1"
}

variable "project-id" {
  default = "test-01-monitoring"
}

variable "image_type" {
  default = "COS"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "disk_size_gb" {
  default = "30"
}

variable "disk_type" {
  default = "pd-standard"
}

variable "preemptible" {
  default = false
}
