terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "5.11.0"
    }
  }
  required_version = ">= 1.4.0"

  backend "remote" {
      hostname     = "app.terraform.io"
      organization = "veerendra2"

      workspaces {
        name = "oracle-cloud-terraform-frankfurt"
      }
    }
}
