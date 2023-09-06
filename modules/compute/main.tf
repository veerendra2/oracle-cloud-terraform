# https://github.com/oracle/terraform-provider-oci/blob/master/examples/always_free/main.tf
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance.html

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
    source_id   = var.image_ocid
  }

  metadata = {
    ssh_authorized_keys = (var.ssh_public_key != "") ? var.ssh_public_key : tls_private_key.compute_ssh_key.public_key_openssh
  }
}


