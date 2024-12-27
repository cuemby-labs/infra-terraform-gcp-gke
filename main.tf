#
# GKE
#

module "gke" {
  source                     = "./modules/terraform-google-kubernetes-engine"
  project_id                 = var.project_id
  name                       = var.name
  region                     = var.region
  zones                      = var.zones
  network                    = var.network
  subnetwork                 = var.subnetwork
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  http_load_balancing        = var.http_load_balancing
  network_policy             = var.network_policy
  horizontal_pod_autoscaling = var.horizontal_pod_autoscaling
  filestore_csi_driver       = var.filestore_csi_driver
  dns_cache                  = var.dns_cache
  # node_pools                 = var.node_pools

  # node_pools = [
  #   {
  #     name                        = var.node_pools["default"]["name"]
  #     machine_type                = var.node_pools["default"]["machine_type"]
  #     node_locations              = var.node_pools["default"]["node_locations"]
  #     min_count                   = var.node_pools["default"]["min_count"]
  #     max_count                   = var.node_pools["default"]["max_count"]
  #     local_ssd_count             = var.node_pools["default"]["local_ssd_count"]
  #     spot                        = var.node_pools["default"]["spot"]
  #     disk_size_gb                = var.node_pools["default"]["disk_size_gb"]
  #     disk_type                   = var.node_pools["default"]["disk_type"]
  #     image_type                  = var.node_pools["default"]["image_type"]
  #     enable_gcfs                 = var.node_pools["default"]["enable_gcfs"]
  #     enable_gvnic                = var.node_pools["default"]["enable_gvnic"]
  #     logging_variant             = var.node_pools["default"]["logging_variant"]
  #     auto_repair                 = var.node_pools["default"]["auto_repair"]
  #     auto_upgrade                = var.node_pools["default"]["auto_upgrade"]
  #     service_account             = var.node_pools["default"]["service_account"]
  #     preemptible                 = var.node_pools["default"]["preemptible"]
  #     initial_node_count          = var.node_pools["default"]["initial_node_count"]
  #     accelerator_count           = var.node_pools["default"]["accelerator_count"]
  #     accelerator_type            = var.node_pools["default"]["accelerator_type"]
  #     gpu_driver_version          = var.node_pools["default"]["gpu_driver_version"]
  #     gpu_sharing_strategy        = var.node_pools["default"]["gpu_sharing_strategy"]
  #     max_shared_clients_per_gpu  = var.node_pools["default"]["max_shared_clients_per_gpu"]
  #   },
  # ]

  # node_pools_oauth_scopes = var.node_pools_oauth_scopes
  # node_pools_labels       = var.node_pools_labels
  # node_pools_metadata     = var.node_pools_metadata
  # node_pools_taints       = var.node_pools_taints
  # node_pools_tags         = var.node_pools_tags
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
