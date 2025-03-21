terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.73.2"
    }
  }
}

locals {
  token = var.TF_VAR_api_token
}

provider "proxmox" {
  endpoint  = "https://10.0.0.2:8006/"
  api_token = "terraform-prov@pve!provider=${local.token}"
}

data "proxmox_virtual_environment_user" "operations_user" {
  user_id = "terraform-prov@pve"
}
