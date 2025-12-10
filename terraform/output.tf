output "vm1_public_ip" {
  value = google_compute_instance.vm1.network_interface[0].access_config[0].nat_ip
}

output "vm2_public_ip" {
  value = google_compute_instance.vm2.network_interface[0].access_config[0].nat_ip
}

output "load_balancer_ip" {
  value = google_compute_global_forwarding_rule.forwarding_rule.ip_address
}
