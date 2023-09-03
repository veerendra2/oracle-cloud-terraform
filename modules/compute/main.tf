# https://github.com/oracle/terraform-provider-oci/blob/master/examples/always_free/main.tf
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance.html

data "oci_core_images" "ubuntu_images" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Ubuntu"
  operating_system_version = "22.04"
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

resource "tls_private_key" "compute_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "oci_core_instance" "instance" {
  availability_domain = var.instance_avail_domain
  compartment_id      = var.compartment_id
  shape               = var.instance_shape
  display_name        = var.instance_display_name

  shape_config {
    memory_in_gbs = var.instance_memory_in_gbs
    ocpus         = var.instance_ocpus
  }

  create_vnic_details {
    assign_private_dns_record = var.instance_vnic_assign_private_dns_record
    assign_public_ip          = var.instance_vnic_assign_public_ip
    display_name              = var.instance_vnic_display_name
    subnet_id                 = var.subnet_id
  }

  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.ubuntu_images.images[0], "id")
  }

  metadata = {
    ssh_authorized_keys = (var.ssh_public_key != "") ? var.ssh_public_key : tls_private_key.compute_ssh_key.public_key_openssh
  }

  # resource "oci_core_volume" "block_volume" {
  #   count               = var.block_volume_count
  #   availability_domain = data.oci_identity_availability_domain.ad.name
  #   compartment_id      = var.compartment_ocid
  #   display_name        = "var.block_volume_display_name${count.index}"
  #   size_in_gbs         = var.block_volume_size_gbs
  # }

  # resource "oci_core_volume_attachment" "block_attach" {
  #   count           = var.num_instances * var.num_iscsi_volumes_per_instance
  #   attachment_type = "iscsi"
  #   instance_id     = oci_core_instance.instance[floor(count.index / var.num_iscsi_volumes_per_instance)].id
  #   volume_id       = oci_core_volume.block_volume[count.index].id
  #   device          = count.index == 0 ? "/dev/oracleoci/oraclevdb" : ""

  #   # Set this to enable CHAP authentication for an ISCSI volume attachment. The oci_core_volume_attachment resource will
  #   # contain the CHAP authentication details via the "chap_secret" and "chap_username" attributes.
  #   use_chap = true
  #   # Set this to attach the volume as read-only.
  #   #is_read_only = true
  # }

}
