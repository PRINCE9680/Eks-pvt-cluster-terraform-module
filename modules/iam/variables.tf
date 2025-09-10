variable "cluster_name" {
  type        = string
  description = "Name prefix for IAM roles"
}

variable "eks_cluster_policies" {
  type        = list(string)
  description = "List of policy ARNs to attach to the EKS cluster role"
}

variable "eks_node_policies" {
  type        = list(string)
  description = "List of policy ARNs to attach to the EKS node group role"
}

variable "tags" {
  description = "Tags to apply to all IAM resources"
  type        = map(string)
  default     = {}
}
