data "oci_identity_availability_domain" "ad" {
  compartment_id = var.compartment_ocid
  ad_number      = var.ad_number
}

resource "tls_private_key" "compute_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "oci_core_instance" "instance" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  shape               = var.instance_shape
  display_name        = var.instance_display_name
  state               = var.instance_state
  freeform_tags       = var.custom_tags
  shape_config {
    memory_in_gbs = var.instance_memory_in_gbs
    ocpus         = var.instance_ocpus
  }

  agent_config {
    are_all_plugins_disabled = true
    is_management_disabled   = true
    is_monitoring_disabled   = true
  }

  create_vnic_details {
    assign_private_dns_record = var.instance_vnic_assign_private_dns_record
    assign_public_ip          = var.instance_vnic_assign_public_ip
    display_name              = var.instance_vnic_display_name
    subnet_id                 = var.subnet_id
    nsg_ids                   = var.ngs_id
  }

  source_details {
    source_type = "image"
    source_id   = var.image_ocid
  }

  metadata = {
    ssh_authorized_keys = (var.ssh_public_key != "") ? var.ssh_public_key : tls_private_key.compute_ssh_key.public_key_openssh
    user_data           = var.default_username
  }
}
