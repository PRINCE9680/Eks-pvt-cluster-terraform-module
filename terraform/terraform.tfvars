aws_region                = "us-west-2"
cluster_name              = "prince-private-eks-cluster"
cluster_version           = "1.28"

vpc_cidr                  = "10.10.0.0/16"

availability_zones        = ["us-west-2a", "us-west-2b"]

public_subnets_cidrs      = [
  "10.10.1.0/24",
  "10.10.2.0/24"
]

private_subnets_cidrs     = [
  "10.10.11.0/24",
  "10.10.12.0/24"
]

node_group_instance_types = ["t3.medium"]

node_group_desired        = 2
node_group_min            = 1
node_group_max            = 3
