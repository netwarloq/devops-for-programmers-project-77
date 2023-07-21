resource "digitalocean_domain" "main" {
  name = var.domain_project
}

resource "digitalocean_record" "domain" {
  domain = digitalocean_domain.main.id
  type   = "A"
  name   = "@"
  value  = digitalocean_loadbalancer.web-lb.ip
}
