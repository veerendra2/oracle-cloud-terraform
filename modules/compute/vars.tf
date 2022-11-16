variable "instance_shape_config_memory_in_gbs" {
  description = "Instance RAM in GB"
  default     = 1
}

variable "instance_shape_config_ocpus" {
  description = "Instance Oracle CPUs"
  default     = 1
}

variable "instance_display_name" {
  description = "Instance display name"
  type        = string
}

variable "instance_vnic_assign_private_dns_record" {
  description = "Create private DNS record"
  type        = bool
  default     = true
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
