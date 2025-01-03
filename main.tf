#
# GKE
#

resource "google_service_account" "account" {
  account_id   = var.admin_email
  display_name = "Walrus GKE Service Account"

  create_ignore_already_exists = true
}

resource "google_compute_network" "network" {
  name                     = "${var.name}-network"
  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = true
}

resource "google_compute_subnetwork" "subnetwork" {
  name             = "${var.name}-subnetwork"
  ip_cidr_range    = var.subnetwork
  region           = var.region
  stack_type       = "IPV4_IPV6"
  ipv6_access_type = var.access_type

  network = google_compute_network.network.id

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = var.ip_range_services
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = var.ip_range_pods
  }
}

resource "google_container_cluster" "cluster" {
  name                     = var.name
  location                 = var.region
  enable_autopilot         = false
  enable_l4_ilb_subsetting = true
  network                  = google_compute_network.network.id
  subnetwork               = google_compute_subnetwork.subnetwork.id

  ip_allocation_policy {
    stack_type                    = "IPV4_IPV6"
    services_secondary_range_name = google_compute_subnetwork.subnetwork.secondary_ip_range[0].range_name
    cluster_secondary_range_name  = google_compute_subnetwork.subnetwork.secondary_ip_range[1].range_name
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  initial_node_count  = var.initial_node_count
  deletion_protection = false
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.name}-node-pool"
  cluster    = google_container_cluster.cluster.name
  location   = var.region

  node_config {
    preemptible     = var.preemptible
    machine_type    = var.machine_type
    disk_size_gb    = var.disk_size
    service_account = google_service_account.account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

#
# Walrus Resources
#

locals {
  context = var.context
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}
