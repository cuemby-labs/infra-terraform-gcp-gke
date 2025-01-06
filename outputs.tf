#
# Cluster outputs
#

# output "cluster_endpoint" {
#   value = google_container_cluster.cluster.endpoint
# }

# output "cluster_ca_certificate" {
#   value = google_container_cluster.cluster.master_auth[0].cluster_ca_certificate
# }

output "kubeconfig" {
  value = data.template_file.kubeconfig.rendered
  description = "Rendered kubeconfig for the GKE cluster."
}

#
# Contextual output
#

output "walrus_project_name" {
  value       = try(local.context["project"]["name"], null)
  description = "The name of project where deployed in Walrus."
}

output "walrus_project_id" {
  value       = try(local.context["project"]["id"], null)
  description = "The id of project where deployed in Walrus."
}

output "walrus_environment_name" {
  value       = try(local.context["environment"]["name"], null)
  description = "The name of environment where deployed in Walrus."
}

output "walrus_environment_id" {
  value       = try(local.context["environment"]["id"], null)
  description = "The id of environment where deployed in Walrus."
}

output "walrus_resource_name" {
  value       = try(local.context["resource"]["name"], null)
  description = "The name of resource where deployed in Walrus."
}

output "walrus_resource_id" {
  value       = try(local.context["resource"]["id"], null)
  description = "The id of resource where deployed in Walrus."
}

#
# Submodule output
#

output "submodule" {
  value       = module.submodule.message
  description = "The message from submodule."
}
