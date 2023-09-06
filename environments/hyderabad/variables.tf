variable "compartment_ocid" {
  description = "Compartmant OCID"
  default     = "ocid1.tenancy.oc1..aaaaaaaa7xzel75y6unvrtsfiuxf7pw2gls4igkgutva4fsdbtyspqvpx2ua"
}

# https://docs.oracle.com/en-us/iaas/images/image/0a68050f-cceb-49bb-a83b-396019ecba67/
variable "image_ocid" {
  description = "Source image OCID of Canonical-Ubuntu-22.04-aarch64-2023.07.20-0"
  default     = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaagvevbjg6koes2ctgsjljhz5twoxs64h7hiupxyj627weurtgh2cq"
}
