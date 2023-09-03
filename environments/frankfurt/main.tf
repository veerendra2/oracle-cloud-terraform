
module "network" {
  source = "../../modules/network"

  compartment_ocid = "ocid1.tenancy.oc1..aaaaaaaawm7wov3ysv42ytc5nmfbmea4mhcibnltcdyenevfkfdho5y26x2a"

  virtual_network_cidr_block   = "10.1.0.0/16"
  virtual_network_display_name = "default-vir-net"
  subnet_cidr_block            = "10.1.20.0/24"
  subnet_display_name          = "default-vir-net-subnet"
  igw_display_name             = "default-igw"
  routing_table_display_name   = "default-route-tbl"
  security_list_display_name   = "default-sl"
}

module "compute" {
  source = "../modules/compute"

  compartment_ocid = "ocid1.tenancy.oc1..aaaaaaaawm7wov3ysv42ytc5nmfbmea4mhcibnltcdyenevfkfdho5y26x2a"

  instance_display_name      = "wireguard-fra"
  instance_vnic_display_name = "wireguard-fra-vnci"
  block_volume_display_name  = "wireguard-fra-blk-vol"
}
