resource "openstack_compute_secgroup_v2" "allow-galaxy" {
  name        = "${var.name}-allow-galaxy"
  description = "Allow ${var.name} traffic"

  rule {
    ip_protocol = "tcp"
    from_port   = 8021
    to_port     = 8021
    cidr        = "0.0.0.0/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port   = 80
    to_port     = 80
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "allow-icmp" {
  name        = "${var.name}-allow-icmp"
  description = "Allow ICMP traffic"

  rule {
    ip_protocol = "icmp"
    from_port   = -1
    to_port     = -1
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "allow-ssh" {
  name        = "${var.name}-allow-ssh"
  description = "Allow SSH traffic"

  rule {
    ip_protocol = "tcp"
    from_port   = 22
    to_port     = 22
    cidr        = "0.0.0.0/0"
  }
}
