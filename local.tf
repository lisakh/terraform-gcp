resource "local_file" "kube_config_yaml" {
  filename = format("%s/%s", path.root, "kube_config.yaml")
  content  = rancher2_cluster.elastic.kube_config
}
