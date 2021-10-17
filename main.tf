terraform {
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}

variable "civo_token" {
    type = string
}

provider "civo" {
  token = var.civo_token
  region = "LON1"
}