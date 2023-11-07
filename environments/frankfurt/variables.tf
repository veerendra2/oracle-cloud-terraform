variable "compartment_ocid" {
  description = "Compartmant OCID"
  default     = ""
}

# https://docs.oracle.com/en-us/iaas/images/ubuntu-2204/
variable "image_ocid_aarch64" {
  description = "Source image ocid of Canonical-Ubuntu-22.04-aarch64-2023.08.23-0 for aarch64(eu-frankfurt-1)"
  default     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaap362udryq4igudmoxz2b5hpkzlhrelii7beusqhps33mxfwn2izq"
}

variable "image_ocid_amd64" {
  description = "Source image ocid of Canonical-Ubuntu-22.04-2023.08.28-0 for amd64(eu-frankfurt-1)"
  default     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaeisuzlxafhqii2lkrgiokeexnru7pepj5l6bc37klyzwnvbffnzq"
}
