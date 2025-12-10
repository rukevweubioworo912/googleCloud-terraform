resource "google_compute_instance" "vm1" {
  name         = "${var.vm_name_prefix}-1"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}
  }

 metadata = {
  ssh-keys = "${var.ssh_user}:${file("${path.module}/id_rsa.pub")}"
}

  tags = ["mage"]
}

resource "google_compute_instance" "vm2" {
  name         = "${var.vm_name_prefix}-2"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}
  }

metadata = {
  ssh-keys = "${var.ssh_user}:${file("${path.module}/id_rsa.pub")}"
}

  tags = ["mage"]
}
