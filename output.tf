output "rancher_url" {
  value = "https://${google_compute_instance.rancher_server.network_interface.0.access_config.0.nat_ip}"
}

output "rancher_token" {
  value = rancher2_bootstrap.admin.token
}

output "custom_cluster_command" {
  value = rancher2_cluster.elastic.cluster_registration_token.0.node_command
}