# Google compute
provider "google" {
  project     = "hr-jan-liska"
  credentials = file("/home/jliska/.config/gcloud/application_default_credentials.json")
  region      = "europe-west3"
  zone        = "europe-west3-a"
}

provider "rancher2" {
  alias = "bootstrap"

  api_url  = "https://${google_compute_instance.rancher_server.network_interface.0.access_config.0.nat_ip}"
  insecure = true
  bootstrap = true
}

provider "rancher2" {
  alias = "admin"

  api_url  = "https://${google_compute_instance.rancher_server.network_interface.0.access_config.0.nat_ip}"
  insecure = true
  token_key = rancher2_bootstrap.admin.token
}
