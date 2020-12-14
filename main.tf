resource "tls_private_key" "global_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "ssh_private_key_pem" {
  filename          = "${path.module}/id_rsa"
  sensitive_content = tls_private_key.global_key.private_key_pem
  file_permission   = "0600"
}

resource "local_file" "ssh_public_key_openssh" {
  filename = "${path.module}/id_rsa.pub"
  content  = tls_private_key.global_key.public_key_openssh
}

resource "google_compute_firewall" "default" {
 name    = "rancher-firewall"
 network = "default"

 allow {
   protocol = "all"
 }
}

// Rancher server
resource "rancher2_bootstrap" "admin" {
  provider = rancher2.bootstrap

  password  = "admin"
}

resource "google_compute_instance" "rancher_server" {
 name         = "rancher-server"
 machine_type = "e2-medium"
 zone         = "europe-west3-a"
 allow_stopping_for_update = true

 boot_disk {
   initialize_params {
     image = "ubuntu-1804-lts"
   }
 }

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }

 metadata = {
   ssh-keys = "${var.service_user}:${tls_private_key.global_key.public_key_openssh}"
   user-data = templatefile(
      join("/", [path.module, "files/rancher_server.template"]),
      {
        docker_version   = var.docker_version
        username         = var.service_user
      }
    )
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]

    connection {
      type        = "ssh"
      host        = self.network_interface.0.access_config.0.nat_ip
      user        = var.service_user
      private_key = tls_private_key.global_key.private_key_pem
    }
  }
}

resource "rancher2_cluster" "elastic" {
  provider = rancher2.admin
  name = "elastic"
  
  rke_config {
    network {
      plugin = "canal"
    }
  }
  enable_cluster_monitoring = true
}

// Rancher nodes
resource "google_compute_instance" "rancher_node" {
  name         = "rancher-node-${count.index}"
  machine_type = "e2-medium"
  zone         = "europe-west3-a"
  allow_stopping_for_update = true
  count = 3

  boot_disk {
   initialize_params {
     image = "ubuntu-1804-lts"
   }
 }

 network_interface {
   network = "default"

   access_config {
   }
 }

 metadata = {
   ssh-keys = "${var.service_user}:${tls_private_key.global_key.public_key_openssh}"
   user-data = templatefile(
      join("/", [path.module, "files/rancher_node.template"]),
      {
        docker_version   = var.docker_version
        username         = var.service_user
        register_command = rancher2_cluster.elastic.cluster_registration_token.0.node_command
      }
    )
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]

    connection {
      type        = "ssh"
      host        = self.network_interface.0.access_config.0.nat_ip
      user        = var.service_user
      private_key = tls_private_key.global_key.private_key_pem
    }
  }
}


