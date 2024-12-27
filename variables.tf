#
# GKE Variables
#

variable "project_id" {
  description = "The project ID to host the cluster in (required)"
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the cluster (required)"
  type        = string
  default     = "gke-cluster-"
}

variable "region" {
  description = "The region to host the cluster in (optional if zonal cluster / required if regional)"
  type        = string
  default     = null
}

variable "zones" {
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  type        = list(string)
  default     = []
}

variable "network" {
  description = "The VPC network to host the cluster in (required)."
  type        = string
  default     = ""
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in (required)."
  type        = string
  default     = ""
}

variable "ip_range_pods" {
  description = "The _name_ of the secondary subnet ip range to use for pods"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ip_range_services" {
  description = "The _name_ of the secondary subnet range to use for services"
  type        = string
  default     = "10.10.0.0/16"
}

variable "http_load_balancing" {
  description = "Enable httpload balancer addon"
  type        = bool
  default     = true
}

variable "network_policy" {
  description = "Enable network policy addon"
  type        = bool
  default     = false
}

variable "horizontal_pod_autoscaling" {
  description = "Enable or disable horizontal pod autoscaling."
  type        = bool
  default     = true
}

variable "filestore_csi_driver" {
  description = "The status of the Filestore CSI driver addon, which allows the usage of filestore instance as volumes"
  type        = bool
  default     = false
}

variable "dns_cache" {
  description = "The status of the NodeLocal DNSCache addon."
  type        = bool
  default     = false
}

variable "node_pools" {
  type        = list(map(any))
  description = "List of maps containing node pools"

  default = [
    {
      name                        = "default-node-pool"
      machine_type                = "e2-medium"
      node_locations              = "us-central1-b,us-central1-c"
      min_count                   = 1
      max_count                   = 100
      local_ssd_count             = 0
      spot                        = false
      disk_size_gb                = 100
      disk_type                   = "pd-standard"
      image_type                  = "COS_CONTAINERD"
      enable_gcfs                 = false
      enable_gvnic                = false
      logging_variant             = "DEFAULT"
      auto_repair                 = true
      auto_upgrade                = true
      service_account             = "project-service-account@<PROJECT ID>.iam.gserviceaccount.com"
      preemptible                 = false
      initial_node_count          = 80
      accelerator_count           = 1
      accelerator_type            = "nvidia-l4"
      gpu_driver_version          = "LATEST"
      gpu_sharing_strategy        = "TIME_SHARING"
      max_shared_clients_per_gpu  = 2
    }
  ]
}

variable "node_pools_oauth_scopes" {
  type        = map(list(string))
  description = "Map of lists containing node oauth scopes by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = ["https://www.googleapis.com/auth/cloud-platform"]
    default-node-pool = []
  }
}

variable "node_pools_labels" {
  type        = map(map(string))
  description = "Map of maps containing node labels by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = {}
    default-node-pool = {}
  }
}

variable "node_pools_metadata" {
  type        = map(map(string))
  description = "Map of maps containing node metadata by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = {}
    default-node-pool = {}
  }
}

variable "node_pools_taints" {
  type        = map(list(object({ key = string, value = string, effect = string })))
  description = "Map of lists containing node taints by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = []
    default-node-pool = []
  }
}

variable "node_pools_tags" {
  type        = map(list(string))
  description = "Map of lists containing node network tags by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = []
    default-node-pool = []
  }
}

#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}
