variable "instance_shape_config_memory_in_gbs" {
  description = "Instance RAM in GB"
  default     = 1
}

variable "instance_shape_config_ocpus" {
  description = "Instance Oracle CPUs"
  default     = 1
}

variable "instance_shape" {
  description = "Instance shape"
  default = "VM.Standard.A1.Flex"
}

variable "instance_display_name" {
  description = "Instance display name"
  type        = string
}

variable "instance_vnic_assign_private_dns_record" {
  description = "Create private DNS record"
  type        = bool
  default     = false
}

variable "instance_vnic_assign_public_ip" {
  description = "Assign public IP"
  type        = bool
  default     = true
}

variable "instance_vnic_display_name" {
  description = "Instance VNIC display name"
  type        = string
}

variable "instance_image_ocid" {
  type = map(string)

  default = {
    # See https://docs.us-phoenix-1.oraclecloud.com/images/
    eu-frankfurt-1    = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaap7velf36uvsguk7e6eyg5tefp74ymj4gnc7rwka3v7flpq74p7gq"
    ap-hyderabad-1    = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaagvevbjg6koes2ctgsjljhz5twoxs64h7hiupxyj627weurtgh2cq"
  }
}