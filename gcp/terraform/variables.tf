#### Google Project ####
# The Google region where the cluster should be created
variable "region" {
  default = "europe-west1"
}

# Google zone where the cluster should be created
variable "zone" {
  default = "europe-west1-d"
}

variable "project" {
  description = "The ID of the Google Cloud project"
}

variable "disk_image" {
  description = "OS image name to use for installation"
  default = "coreos-stable"
}

variable "disk_size" {
  description = "Disk size"
  default = "20"
}

# Disk type to use for installation
variable "disk_type" {
  default = "pd-standard"
}

# Benchmark machine type (flavor)
variable "machine_type" {
  default = "n1-highmem-2"
}

variable "subnet" {
  default = "portal-subnet"
}

variable "net" {
  default = "shared-net"
}

# Number of instances to install
variable "instances" {
  default = "1"
}

# The name of the deployment
variable "name" {
  default = "galaxy-docker"
}

# Docker
variable "docker_repository" {
  default = "bgruening/galaxy-stable"
}

variable "docker_ports" {
  default = "-p 8080:80 -p 8021:21"
}

