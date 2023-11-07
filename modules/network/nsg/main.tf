resource "oci_core_network_security_group" "this" {
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_id
  display_name   = var.nsg_display_name
}

resource "oci_core_network_security_group_security_rule" "icmp_egress" {
  network_security_group_id = oci_core_network_security_group.this.id
  direction                 = "EGRESS"
  protocol                  = "1"
  description               = "Allow all egress ICMP codes"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "icmp_ingress" {
  count                     = var.allow_ingress_ping ? 1 : 0
  network_security_group_id = oci_core_network_security_group.this.id
  direction                 = "INGRESS"
  protocol                  = "1"
  description               = "Allow all ingress ICMP codes"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "tcp_egress" {
  network_security_group_id = oci_core_network_security_group.this.id
  direction                 = "EGRESS"
  protocol                  = "6"
  description               = "Allow all TCP egress"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "udp_egress" {
  network_security_group_id = oci_core_network_security_group.this.id
  direction                 = "EGRESS"
  protocol                  = "17"
  description               = "Allow all UDP egress"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "tcp_ingress" {
  count                     = length(var.allow_tcp_ingress_ports)
  network_security_group_id = oci_core_network_security_group.this.id
  direction                 = "INGRESS"
  protocol                  = "6"
  description               = "Allow ingress TCP port ${var.allow_tcp_ingress_ports[count.index]}"
  source                    = var.allow_tcp_ingress_cidr
  source_type               = "CIDR_BLOCK"

  tcp_options {
    destination_port_range {
      min = var.allow_tcp_ingress_ports[count.index]
      max = var.allow_tcp_ingress_ports[count.index]
    }
  }
}

resource "oci_core_network_security_group_security_rule" "udp_ingress" {
  count                     = length(var.allow_udp_ingress_ports)
  network_security_group_id = oci_core_network_security_group.this.id
  direction                 = "INGRESS"
  protocol                  = "17"
  description               = "Allow ingress UDP port ${var.allow_udp_ingress_ports[count.index]}"
  source                    = var.allow_udp_ingress_cidr
  source_type               = "CIDR_BLOCK"

  udp_options {
    destination_port_range {
      min = var.allow_udp_ingress_ports[count.index]
      max = var.allow_udp_ingress_ports[count.index]
    }
  }
}
