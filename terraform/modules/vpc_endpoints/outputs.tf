output "s3_endpoint_id" {
  description = "ID of the S3 Gateway VPC endpoint"
  value       = aws_vpc_endpoint.s3.id
}

output "interface_endpoint_ids" {
  description = "Map of interface endpoint IDs"
  value       = { for k, v in aws_vpc_endpoint.interface_endpoints : k => v.id }
}

output "endpoints_security_group_id" {
  description = "Security group ID for interface endpoints"
  value       = aws_security_group.endpoints_sg.id
}
