resource "google_compute_firewall" "allow-galaxy" {
  name    = "${var.name}-allow-galaxy"
  network = "${var.net}"

  allow {
    protocol = "tcp"
    ports    = ["8080", "8021"]
  }

  target_tags   = ["galaxy-server"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-icmp" {
  name    = "${var.name}-allow-icmp"
  network = "${var.net}"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.name}-allow-ssh"
  network = "${var.net}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
