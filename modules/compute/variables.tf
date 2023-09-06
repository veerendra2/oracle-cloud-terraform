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

variable "ad_number" {
  description = "Instance availability domain"
  default     = 2
}

variable "instance_state" {
  type        = string
  description = "Target state for the instance.RUNNING/STOPPED."
  default     = "RUNNING"

  validation {
    condition     = contains(["RUNNING", "STOPPED"], var.instance_state)
    error_message = "Accepted values are RUNNING or STOPPED."
  }
}

variable "instance_display_name" {
  description = "Instance display name"
  type        = string
}

variable "image_ocid" {
  description = "Source image OCID"
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

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
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

variable "boot_volume_backup_policy" {
  description = "backup policies : gold/silver/bronze"
  type        = string
  default     = "disabled"

  validation {
    condition     = contains(["gold", "silver", "bronze", "disabled"], var.boot_volume_backup_policy)
    error_message = "Accepted values are gold, silver, bronze or disabled (case sensitive)."
  }
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
  default     = ""
}

