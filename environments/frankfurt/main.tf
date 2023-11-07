module "wireguard_vm" {
  source = "../../modules/compute"

  compartment_ocid           = var.compartment_ocid
  image_ocid                 = var.image_ocid_amd64
  instance_memory_in_gbs     = 1
  instance_ocpus             = 1
  instance_shape             = "VM.Standard.E2.1.Micro"
  ad_number                  = 2
  instance_display_name      = "wg-fra"
  instance_vnic_display_name = "Wireguard VM VNIC"
  subnet_id                  = oci_core_subnet.wireguard.id
  ngs_id                     = [module.wireguard_nsg.nsg_id]

  custom_tags = {
    "group" = "wireguard"
  }
}
