resource "digitalocean_loadbalancer" "web-lb" {
  name   = "${var.namepj}-web-lb"
  region = var.regiondc

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 3000
    target_protocol = "http"
  }

  forwarding_rule {
    certificate_id = digitalocean_certificate.cert.id
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 3000
    target_protocol = "http"
  }

  healthcheck {
    port     = 3000
    protocol = "http"
    path     = "/"
  }

  sticky_sessions {
    type               = "cookies"
    cookie_name        = "${var.namepj}_cookies"
    cookie_ttl_seconds = 300
  }

  droplet_ids = [digitalocean_droplet.web[0].id, digitalocean_droplet.web[1].id]
}
