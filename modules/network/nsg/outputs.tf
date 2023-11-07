output "nsg_id" {
  description = "NSG ID"
  value       = oci_core_network_security_group.this.id
}
