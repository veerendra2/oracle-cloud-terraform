
resource "oci_core_volume_backup_policy_assignment" "boot_volume_backup_policy" {
  asset_id  = oci_core_instance.instance.boot_volume_id
  policy_id = var.boot_volume_backup_policy
}

resource "oci_core_volume" "block_volume" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = var.block_volume_display_name
  size_in_gbs         = var.block_volume_size_gbs
}

resource "oci_core_volume_attachment" "block_attach" {
  attachment_type = "iscsi"
  instance_id     = oci_core_instance.instance.id
  volume_id       = oci_core_volume.block_volume.id
  use_chap        = true
}
