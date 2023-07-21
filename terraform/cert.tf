resource "digitalocean_certificate" "cert" {
  name       = "${var.namepj}le"
  type       = "lets_encrypt"
  domains    = [var.domain_project]
  depends_on = [digitalocean_domain.main]
}
