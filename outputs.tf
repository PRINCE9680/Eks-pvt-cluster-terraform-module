output "eks_endpoint" {
  description = "EKS cluster endpoint URL (private access only)"
  value       = module.eks_private_cluster.cluster_endpoint
}

output "eks_cluster_ca" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks_private_cluster.cluster_certificate_authority_data
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "worker_security_group_id" {
  description = "Security Group ID for EKS worker nodes"
  value       = module.security_groups.worker_security_group_id
}

output "eks_cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = module.iam.eks_cluster_role_arn
}

output "node_group_role_arn" {
  description = "ARN of the EKS node group IAM role"
  value       = module.iam.node_group_role_arn
}

output "s3_endpoint_id" {
  description = "ID of the S3 Gateway VPC endpoint"
  value       = module.vpc_endpoints.s3_endpoint_id
}

output "interface_endpoint_ids" {
  description = "Map of interface endpoint IDs"
  value       = module.vpc_endpoints.interface_endpoint_ids
}

output "endpoints_security_group_id" {
  description = "Security group ID for interface endpoints"
  value       = module.vpc_endpoints.endpoints_security_group_id
}
