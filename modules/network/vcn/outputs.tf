output "vcn_id" {
  description = "Subnet ID"
  value       = oci_core_virtual_network.this.id
}

output "route_table_id" {
  description = "Route table ID"
  value       = oci_core_route_table.this.id
}

output "dhcp_options_id" {
  description = "DHCP options ID"
  value       = oci_core_virtual_network.this.default_dhcp_options_id
}