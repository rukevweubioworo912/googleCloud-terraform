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

resource "google_compute_firewall" "swarm" {
  name    = "allow-swarm"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["2377", "7946"]
  }

  allow {
    protocol = "udp"
    ports    = ["7946", "4789"]
  }

  source_ranges = ["0.0.0.0/0"] # adjust to your VPC subnet
}

resource "google_compute_firewall" "allow_8080" {
  name    = "allow-8080"
  network = google_compute_network.vpc.name # your VPC resource name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["mage"]
}
