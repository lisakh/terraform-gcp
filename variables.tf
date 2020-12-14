variable "service_user" {
  type        = string
  description = "Service user name."
  default     = "serviceadm"
}

variable "docker_version" {
  type        = string
  description = "Docker version to install on nodes"
  default     = "19.03"
}

variable "node_count" {
  type        = string
  description = "Number of nodes"
  default     = "3"
}