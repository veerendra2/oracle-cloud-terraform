variable "compartment_ocid" {
  description = "Compartmant OCID"
  type        = string
}

variable "vcn_id" {
  description = "VCN ID"
  type        = string
}

variable "nsg_display_name" {
  description = "Network security group display name"
  type        = string
}

variable "allow_tcp_ingress_ports" {
  description = "TCP ingress ports to be allowed"
  type        = list(string)
}

variable "allow_udp_ingress_ports" {
  description = "UDP ingress ports to be allowed"
  type        = list(string)
}

variable "allow_tcp_ingress_cidr" {
  description = "TCP ingress cidr to be allowed"
  type        = string
  default     = "0.0.0.0/0"
}

variable "allow_udp_ingress_cidr" {
  description = "UDP ingress cidr to be allowed"
  type        = string
  default     = "0.0.0.0/0"
}

variable "allow_ingress_ping" {
  description = "Allow ping host"
  type        = bool
  default     = true
}
