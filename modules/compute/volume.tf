resource "oci_core_volume" "block_volume" {
  count               = var.block_volume_size_gbs != null ? 1 : 0
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = var.block_volume_display_name
  size_in_gbs         = var.block_volume_size_gbs
}

resource "oci_core_volume_attachment" "block_attach" {
  count           = var.block_volume_size_gbs != null ? 1 : 0
  attachment_type = "iscsi"
  instance_id     = oci_core_instance.instance.id
  volume_id       = oci_core_volume.block_volume[0].id
  use_chap        = true
}
