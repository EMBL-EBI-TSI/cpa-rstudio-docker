resource "openstack_compute_keypair_v2" "ssh_keypair" {
  name       = "${var.name}_keypair"
  public_key = "${file("${var.portal_public_key_path}")}"
}

resource "openstack_compute_instance_v2" "instance" {
  count       = "${var.instances}"
  name        = "${var.name}-instance-${count.index + 1}"
  image_name    = "${var.disk_image}"
  flavor_name = "${var.machine_type}"
  key_pair    = "${openstack_compute_keypair_v2.ssh_keypair.name}"

  network {
    name           = "${var.net}"
    access_network = true
  }

  provisioner "remote-exec" {
    connection {
      user = "core"
      private_key = "${file("${var.portal_private_key_path}")}"
    }

    inline = [
      "docker run -d ${var.docker_ports} ${var.docker_repository} &>/dev/null",
      "echo ${var.profile_public_key} >> ~/.ssh/authorized_keys",
      "echo terraform executed > /tmp/foo",
    ]
  }

  security_groups = [
    "${openstack_compute_secgroup_v2.allow-galaxy.name}",
    "${openstack_compute_secgroup_v2.allow-icmp.name}",
    "${openstack_compute_secgroup_v2.allow-ssh.name}",
  ]

  floating_ip = "${openstack_networking_floatingip_v2.floatingip.address}"
}
