resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_mage" {
  name    = "allow-mage"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["6789"]
  }

  source_ranges = ["0.0.0.0/0"]
}
