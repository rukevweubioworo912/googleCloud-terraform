resource "google_compute_instance_group" "ig" {
  name      = "mage-instance-group"
  zone      = var.zone
  instances = [
    google_compute_instance.vm1.id,
    google_compute_instance.vm2.id
  ]

  named_port {
    name = "http"
    port = 8080
  }
}

resource "google_compute_health_check" "hc" {
  name = "mage-health-check"

  tcp_health_check {
    port = 8080
  }
}

resource "google_compute_backend_service" "backend" {
  name                  = "mage-backend"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [google_compute_health_check.hc.id]

  backend {
    group = google_compute_instance_group.ig.id
  }
}

resource "google_compute_url_map" "url_map" {
  name            = "mage-url-map"
  default_service = google_compute_backend_service.backend.id
}

resource "google_compute_target_http_proxy" "proxy" {
  name    = "mage-http-proxy"
  url_map = google_compute_url_map.url_map.id
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "mage-forwarding-rule"
  target     = google_compute_target_http_proxy.proxy.id
  port_range = "80"
}
