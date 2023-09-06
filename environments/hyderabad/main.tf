
module "network" {
  source = "../../modules/network"

  compartment_ocid = var.compartment_ocid

  virtual_network_cidr_block   = "10.1.0.0/16"
  virtual_network_display_name = "vir-net-00"
  subnet_cidr_block            = "10.1.20.0/24"
  subnet_display_name          = "vir-net-subnet-00"
  igw_display_name             = "igw-00"
  routing_table_display_name   = "route-tbl-00"
  security_list_display_name   = "sl-00"
}

module "compute" {
  source = "../../modules/compute"

  compartment_ocid = var.compartment_ocid
  image_ocid       = var.image_ocid

  instance_avail_domain      = "QZTD:EU-FRANKFURT-1-AD-2"
  instance_display_name      = "wireguard-hyd"
  instance_vnic_display_name = "wireguard-hyd-vnci"
  block_volume_display_name  = "wireguard-hyd-blk-vol"
  block_volume_size_gbs      = 100
  subnet_id                  = module.network.subnet_id
}
