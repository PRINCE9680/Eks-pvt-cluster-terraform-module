output "vpc_endpoint_s3_id" {
  description = "ID of the S3 Gateway VPC Endpoint"
  value       = module.vpc_endpoints.s3_endpoint_id
}

output "vpc_endpoint_interface_ids" {
  description = "Map of Interface VPC Endpoint IDs"
  value       = module.vpc_endpoints.interface_endpoint_ids
}

output "vpc_endpoint_sg_id" {
  description = "Security Group ID used by interface endpoints"
  value       = module.vpc_endpoints.endpoints_security_group_id
}
