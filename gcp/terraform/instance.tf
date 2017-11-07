resource "google_compute_instance" "instance" {
  count         = "${var.instances}"
  name          = "${var.name}-instance-${count.index + 1}"
  machine_type  = "${var.machine_type}"
  zone          = "${var.zone}"
  tags          = ["galaxy-server", "ssh"]

  disk {
    image       = "${var.disk_image}"
    type        = "${var.disk_type}"
    size        = "${var.disk_size}"
  }

  metadata {
    count       = "${var.instances}"
    clustername = "${var.name}"
    myid        = "${count.index}"
  }

  # network interface
  network_interface {
    subnetwork    = "${var.subnet}"
    access_config {
      // Ephemeral IP
    }
  }

  provisioner "remote-exec" {
    connection {
        user = "centos"
  }
    inline = [
      "docker run -d ${var.docker_ports} ${var.docker_repository}"
    ]
  }
}
