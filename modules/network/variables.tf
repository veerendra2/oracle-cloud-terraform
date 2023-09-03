variable "compartment_ocid" {
  description = "Compartmant OCID"
  type        = string
}

variable "virtual_network_cidr_block" {
  description = "Virtaul network CIDR block"
  type        = string
}

variable "virtual_network_display_name" {
  description = "Virtual network display name"
  type        = string
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR block. It should be with in the 'virtual_network_cidr_block' network"
  type        = string
  default     = "10.1.20.0/24"
}

variable "subnet_display_name" {
  description = "Subnet display name"
  type        = string
}

variable "igw_display_name" {
  description = "Internet gateway display name"
  type        = string
}

variable "routing_table_display_name" {
  description = "Routing table display name"
  type        = string
}

variable "security_list_display_name" {
  description = "Routing table display name"
  type        = string
}
