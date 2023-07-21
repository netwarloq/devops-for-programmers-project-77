resource "digitalocean_droplet" "web" {
  count    = var.countdroplets
  image    = "docker-20-04"
  name     = "${var.namepj}-${count.index + 1}"
  region   = var.regiondc
  size     = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh.id]
  tags     = ["${var.namepj}-web"]
}

data "digitalocean_tag" "webtag" {
  name       = "${var.namepj}-web"
  depends_on = [digitalocean_droplet.web]
}
