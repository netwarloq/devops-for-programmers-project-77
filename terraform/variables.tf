variable "ssh_key_name" {
    description = "SSH key name"
    type = string
    sensitive = true
}

variable "regiondc" {
    description = "Region DC"
    type = string
    sensitive = true
}

variable "countdroplets" {
    description = "Count Droplets"
    type = number
    sensitive = true
}

variable "namepj" {
    description = "Name project/app"
    type = string
    sensitive = true
}

variable "cred_terr_app" {
    description = "Credential app.terraform"
    type = string
    sensitive = true
}

variable "domain_project" {
    description = "Domain name project"
    type = string
    sensitive = true
}

variable "dd_api_key" {
  type      = string
  sensitive = true
}

variable "dd_app_key" {
  type      = string
  sensitive = true
}