output "rancher_url" {
  value = "https://${google_compute_address.rancher-ip-address.address}"
}

output "rancher_token" {
  value = rancher2_bootstrap.admin.token
}
