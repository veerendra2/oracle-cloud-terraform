module "default_vcn" {
  source = "../../modules/network/vcn"

  compartment_ocid             = var.compartment_ocid
  virtual_network_cidr_block   = "10.1.0.0/16"
  virtual_network_display_name = "Default VCN"
  igw_display_name             = "Default IGW"
  routing_table_display_name   = "Default Routing Table"
}

resource "oci_core_subnet" "wireguard" {
  compartment_id  = var.compartment_ocid
  vcn_id          = module.default_vcn.vcn_id
  cidr_block      = "10.1.21.0/24"
  display_name    = "Wireguard Subnet"
  route_table_id  = module.default_vcn.route_table_id
  dhcp_options_id = module.default_vcn.dhcp_options_id
}

module "wireguard_nsg" {
  source = "../../modules/network/nsg"

  compartment_ocid        = var.compartment_ocid
  vcn_id                  = module.default_vcn.vcn_id
  nsg_display_name        = "Wireguard NSG"
  allow_ingress_ping      = false
  allow_tcp_ingress_ports = [22, 80, 443]
  allow_udp_ingress_ports = [51820]
}
