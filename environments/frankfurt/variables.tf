variable "compartment_ocid" {
  description = "Compartmant OCID"
  default     = "ocid1.tenancy.oc1..aaaaaaaawm7wov3ysv42ytc5nmfbmea4mhcibnltcdyenevfkfdho5y26x2a"
}

# https://docs.oracle.com/en-us/iaas/images/image/0a68050f-cceb-49bb-a83b-396019ecba67/
variable "image_ocid" {
  description = "Source image OCID of Canonical-Ubuntu-22.04-aarch64-2023.07.20-0"
  default     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaap7velf36uvsguk7e6eyg5tefp74ymj4gnc7rwka3v7flpq74p7gq"
}
