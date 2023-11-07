provider "oci" {
  region       = "eu-frankfurt-1"
  user_ocid    = ""
  tenancy_ocid = ""
  fingerprint  = ""
}

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.13.0"
    }
  }
  required_version = ">= 1.4.0"

  backend "http" {
    address        = "https://gitlab.com/api/v4/projects/11111111/terraform/state/frankfurt"
    lock_address   = "https://gitlab.com/api/v4/projects/11111111/terraform/state/frankfurt/lock"
    unlock_address = "https://gitlab.com/api/v4/projects/11111111/terraform/state/frankfurt/lock"
    unlock_method  = "DELETE"
    lock_method    = "POST"
    retry_wait_min = 5
  }
}
