# Instance group
resource "google_compute_instance_group" "ig" {
  name = "mage-instance-group"
  zone = var.zone
  instances = [
    google_compute_instance.vm1.id,
    google_compute_instance.vm2.id
  ]

  named_port {
    name = "tcp-8080"
    port = 8080
  }
}

# TCP health check
resource "google_compute_health_check" "tcp_hc" {
  name = "mage-tcp-health-check"

  tcp_health_check {
    port = 8080
  }
}

# Backend service (TCP)
resource "google_compute_backend_service" "tcp_backend" {
  name                  = "mage-tcp-backend"
  protocol              = "TCP"
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [google_compute_health_check.tcp_hc.id]

  backend {
    group = google_compute_instance_group.ig.id
  }
}

# TCP target proxy
resource "google_compute_target_tcp_proxy" "tcp_proxy" {
  name            = "mage-tcp-proxy"
  backend_service = google_compute_backend_service.tcp_backend.id
}

# Forwarding rule for TCP
resource "google_compute_global_forwarding_rule" "tcp_forwarding" {
  name       = "mage-tcp-forwarding-rule"
  target     = google_compute_target_tcp_proxy.tcp_proxy.id
  port_range = "8080"
}
