#
# GKE Variables
#

# variable "project_id" {
#   description = "The project ID to host the cluster in (required)"
#   type        = string
#   default     = ""
# }

variable "name" {
  description = "The name of the cluster (required)."
  type        = string
  default     = "gke-cluster"
}

variable "region" {
  description = "The region to host the cluster in (optional if zonal cluster / required if regional)."
  type        = string
  default     = null
}

# variable "zones" {
#   description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
#   type        = list(string)
#   default     = []
# }

variable "access_type" {
  description = "The VPC network to host the cluster in (required)."
  type        = string
  default     = "INTERNAL"
}

# variable "network" {
#   description = "The VPC network to host the cluster in (required)."
#   type        = string
#   default     = ""
# }

variable "subnetwork" {
  description = "The subnetwork to host the cluster in (required)."
  type        = string
  default     = "10.0.0.0/16"
}

variable "machine_type" {
  description = "The machine type for the node pool (required)."
  type        = string
  default     = "e2-medium"
}

variable "disk_size" {
  description = "The disk size (in GB) for each node (optional)."
  type        = number
  default     = 25
}

variable "preemptible" {
  description = "Specifies if the nodes are preemptible (optional)."
  type        = bool
  default     = false
}

variable "ip_range_pods" {
  description = "The _name_ of the secondary subnet ip range to use for pods (required)."
  type        = string
  default     = "192.168.0.0/24"
}

variable "ip_range_services" {
  description = "The _name_ of the secondary subnet range to use for services (required)."
  type        = string
  default     = "192.168.1.0/24"
}

variable "initial_node_count" {
  description = "The initial number of nodes in the node pool (required)."
  type        = number
  default     = 3
}

variable "admin_email" {
  description = "The admin email for IAM permissions (required)."
  type        = string
  default     = "walrus-gke-service-account-id"
}

# variable "node_pools_labels" {
#   type        = map(map(string))
#   description = "Map of maps containing node labels by node-pool name"

#   # Default is being set in variables_defaults.tf
#   default = {
#     all               = {}
#     default-node-pool = {}
#   }
# }

# variable "node_pools_metadata" {
#   type        = map(map(string))
#   description = "Map of maps containing node metadata by node-pool name"

#   # Default is being set in variables_defaults.tf
#   default = {
#     all               = {}
#     default-node-pool = {}
#   }
# }

# variable "node_pools_taints" {
#   type        = map(list(object({ key = string, value = string, effect = string })))
#   description = "Map of lists containing node taints by node-pool name"

#   # Default is being set in variables_defaults.tf
#   default = {
#     all               = []
#     default-node-pool = []
#   }
# }

# variable "node_pools_tags" {
#   type        = map(list(string))
#   description = "Map of lists containing node network tags by node-pool name"

#   # Default is being set in variables_defaults.tf
#   default = {
#     all               = []
#     default-node-pool = []
#   }
# }

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
