variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "prince-private-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.28"
}

variable "aws_region" {
  description = "AWS region to deploy the EKS cluster"
  type        = string
  default     = "us-west-2"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EKS cluster and node groups"
  type        = list(string)
  default     = []
}

variable "node_group_desired" {
  description = "Desired number of nodes in the EKS worker node group"
  type        = number
  default     = 2
}

variable "node_group_min" {
  description = "Minimum number of nodes in the EKS worker node group"
  type        = number
  default     = 1
}

variable "node_group_max" {
  description = "Maximum number of nodes in the EKS worker node group"
  type        = number
  default     = 3
}

variable "node_group_instance_types" {
  description = "EC2 instance types for the EKS worker nodes"
  type        = list(string)
  default     = ["t2.medium"]
}

variable "eks_cluster_role_arn" {
  description = "IAM role ARN for EKS control plane"
  type        = string
}

variable "node_group_role_arn" {
  description = "IAM role ARN for EKS worker nodes"
  type        = string
}

variable "ec2_ssh_key" {
  description = "EC2 SSH key pair name for worker nodes"
  type        = string
}

variable "ami_type" {
  description = "AMI type for worker nodes"
  type        = string
  default     = "AL2_x86_64"
}

variable "endpoint_private_access" {
  description = "Whether the cluster API server has private endpoint enabled"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Whether the cluster API server has public endpoint enabled"
  type        = bool
  default     = false
}

variable "public_access_cidrs" {
  description = "Allowed CIDRs for public API server access"
  type        = list(string)
  default     = []
}

variable "enabled_cluster_log_types" {
  description = "List of enabled cluster log types"
  type        = list(string)
  default     = ["api", "audit", "authenticator"]
}

variable "tags" {
  description = "Tags for EKS cluster"
  type        = map(string)
  default     = {}
}

variable "node_group_tags" {
  description = "Tags for node group"
  type        = map(string)
  default     = {}
}
