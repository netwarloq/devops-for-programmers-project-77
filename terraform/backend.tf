terraform {
  cloud {
    organization = "netwarloq"

    workspaces {
      name = "hexlet-ws"
    }
  }
}
