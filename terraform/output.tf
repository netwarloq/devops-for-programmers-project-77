output "vault" {
  value = templatefile(
    "vault.tpl",
    {
      db_host    = digitalocean_database_cluster.postgres-db-cl.private_host,
      db_port    = digitalocean_database_cluster.postgres-db-cl.port,
      db_user    = digitalocean_database_cluster.postgres-db-cl.user,
      db_pass    = nonsensitive(digitalocean_database_cluster.postgres-db-cl.password),
      db_name    = digitalocean_database_cluster.postgres-db-cl.database,
      dd_api_key = nonsensitive(var.datadog_api_key)
    }
  )
}

output "inventory" {
  value = templatefile(
    "inventory.tpl",
    {
      webserver1 = digitalocean_droplet.web[0].ipv4_address,
      webserver2 = digitalocean_droplet.web[1].ipv4_address
    }
  )
}
