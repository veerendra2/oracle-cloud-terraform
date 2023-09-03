variable "compartment_ocid" {
  description = "Compartmant OCID"
  type        = string
}

variable "instance_memory_in_gbs" {
  description = "Instance RAM in GB"
  default     = 24
}

variable "instance_ocpus" {
  description = "Instance Oracle CPUs"
  default     = 4
}

variable "instance_shape" {
  description = "Instance shape"
  default     = "VM.Standard.A1.Flex"
}

variable "instance_avail_domain" {
  description = "Instance availability domain"
  default     = "QZTD:EU-FRANKFURT-1-AD-2"
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

variable "block_volume_count" {
  description = "Block volume count"
  type        = number
  default     = 1
}

variable "block_volume_display_name" {
  description = "Block  volume display name"
  type        = string
}

variable "block_volume_size_gbs" {
  description = "Block volume size in GBs"
  type        = number
  default     = 50
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

