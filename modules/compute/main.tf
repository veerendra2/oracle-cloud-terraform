# https://github.com/oracle/terraform-provider-oci/blob/master/examples/always_free/main.tf
resource "oci_core_instance" "instance" {
  availability_domain = var.instance_availability_domain
  compartment_id      = var.compartment_id
  shape               = var.instance_shape

  display_name = var.instance_display_name

  shape_config {
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
    ocpus         = var.instance_shape_config_ocpus
  }

  create_vnic_details {
    assign_private_dns_record = var.instance_create_vnic_details_assign_private_dns_record
    assign_public_ip          = var.instance_create_vnic_details_assign_public_ip
    display_name              = var.instance_create_vnic_details_display_name
    nsg_ids                   = var.instance_create_vnic_details_nsg_ids
    private_ip                = var.instance_create_vnic_details_private_ip
    skip_source_dest_check    = var.instance_create_vnic_details_skip_source_dest_check

    subnet_id                 = oci_core_subnet.test_subnet.id
    vlan_id                   = oci_core_vlan.test_vlan.id
  }

resource "oci_core_volume" "test_block_volume" {
  count               = 1
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = "TestBlock${count.index}"
  size_in_gbs         = var.db_size
}

resource "oci_core_volume_attachment" "test_block_attach" {
  count           = var.num_instances * var.num_iscsi_volumes_per_instance
  attachment_type = "iscsi"
  instance_id     = oci_core_instance.test_instance[floor(count.index / var.num_iscsi_volumes_per_instance)].id
  volume_id       = oci_core_volume.test_block_volume[count.index].id
  device          = count.index == 0 ? "/dev/oracleoci/oraclevdb" : ""

  # Set this to enable CHAP authentication for an ISCSI volume attachment. The oci_core_volume_attachment resource will
  # contain the CHAP authentication details via the "chap_secret" and "chap_username" attributes.
  use_chap = true
  # Set this to attach the volume as read-only.
  #is_read_only = true
}

}
