resource "digitalocean_project" "newproject" {
  name        = var.namepj
  description = "A project for infra as code"
  purpose     = "Web Application"
  resources   = concat([digitalocean_database_cluster.postgres-db-cl.urn, digitalocean_loadbalancer.web-lb.urn, digitalocean_domain.main.urn], tolist(digitalocean_droplet.web.*.urn))
}
