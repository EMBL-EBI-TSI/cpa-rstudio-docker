#### Deployment ####
variable "name" {
  default     = "rstudio-docker"
  description = "The name of the deployment"
}

variable "instances" {
  default     = "1"
  description = "Number of instances to install"
}

#### Docker ####
variable "docker_repository" {
  default = "rocker/rstudio"
}

variable "docker_ports" {
  default = "-p 80:80 -p 8021:21 -p 8787:8787"
}

#### OpenStack ####

variable "disk_image" {
  default     = "dfa7210b-524c-44bd-8ff8-9a19ebe332fc"
  description = "OS image id to use for installation"
}

variable "machine_type" {
  default     = "s1.modest"
  description = "Machine type (flavor)"
}

variable "floatingip_pool" {
  default = "net_external"
}

variable "net" {
  description = "The name of the OpenStack network where to deploy the instance"
}

#### Key ####
variable "portal_private_key_path" {
  description = "private key path used to deploy the machine"
}

variable "portal_public_key_path" {
  description = "public key path used to deploy the machine"
}

variable "profile_public_key" {
  description = "public key from user that is to be added"
}
