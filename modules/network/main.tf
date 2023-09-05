resource "oci_core_virtual_network" "vcn" {
  cidr_block     = var.virtual_network_cidr_block
  compartment_id = var.compartment_ocid
  display_name   = var.virtual_network_display_name
}

resource "oci_core_subnet" "subnet" {
  cidr_block        = var.subnet_cidr_block
  display_name      = var.subnet_display_name
  security_list_ids = [oci_core_security_list.security_list.id]
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_virtual_network.vcn.id
  route_table_id    = oci_core_route_table.route_table.id
  dhcp_options_id   = oci_core_virtual_network.vcn.default_dhcp_options_id
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_ocid
  display_name   = var.igw_display_name
  vcn_id         = oci_core_virtual_network.vcn.id
}

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = var.routing_table_display_name

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

resource "oci_core_security_list" "security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = var.security_list_display_name

  # TODO: Need to add in loops
  egress_security_rules {
    description = "TCP protocol allow all traffic to everywhere"
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    description = "TCP protocol allow port 22 from everywhere"
    protocol    = "6"
    source      = "0.0.0.0/0"

    tcp_options {
      max = "22"
      min = "22"
    }
  }

  ingress_security_rules {
    description = "TCP protocol allow port 44 from everywhere"
    protocol    = "6"
    source      = "0.0.0.0/0"

    tcp_options {
      max = "443"
      min = "443"
    }
  }

  ingress_security_rules {
    description = "TCP protocol allow port 5182(wireguard) from everywhere"
    protocol    = "6"
    source      = "0.0.0.0/0"

    tcp_options {
      max = "51820"
      min = "51820"
    }
  }
}