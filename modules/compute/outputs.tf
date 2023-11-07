output "generated_private_key_pem" {
  value     = (var.ssh_public_key != "") ? var.ssh_public_key : tls_private_key.compute_ssh_key.private_key_pem
  sensitive = true
}

output "instance_id" {
  description = "OCID of created instance"
  value       = oci_core_instance.instance.id
}

output "private_ip" {
  description = "Private IP of created instance"
  value       = oci_core_instance.instance.private_ip
}

output "public_ip" {
  description = "Public IP of created instance"
  value       = oci_core_instance.instance.public_ip
}

output "instance_all_attributes" {
  description = "All attributes of created instance"
  value       = { for k, v in oci_core_instance.instance : k => v }
}
