terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.73.2"
    }
  }
}

variable "api_token" {
   type=string
}

provider "proxmox" {
  endpoint  = "https://192.168.1.58:8006/"
  api_token = "terraform-prov@pve!terraform-api=${var.api_token}"
  insecure  = true
  ssh {
    agent    = true
    username = "terraform-prov"
  }
}

#data "proxmox_virtual_environment_user" "operations_user" {
#  user_id = "terraform-prov@pve"
#}
