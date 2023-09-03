
module "compute" {
  source = "../modules/compute"

  instance_display_name      = "wireguard-vpn-hyd"
  instance_vnic_display_name = "default"

  instance_image_ocid = ""

}