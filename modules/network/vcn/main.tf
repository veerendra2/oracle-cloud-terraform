resource "oci_core_virtual_network" "this" {
  cidr_block     = var.virtual_network_cidr_block
  compartment_id = var.compartment_ocid
  display_name   = var.virtual_network_display_name
}

resource "oci_core_internet_gateway" "this" {
  compartment_id = var.compartment_ocid
  display_name   = var.igw_display_name
  vcn_id         = oci_core_virtual_network.this.id
}

resource "oci_core_route_table" "this" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.this.id
  display_name   = var.routing_table_display_name

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.this.id
  }
}
