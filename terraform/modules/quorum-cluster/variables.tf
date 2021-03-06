variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.
Example: ~/.ssh/terraform.pub
DESCRIPTION
}

variable "private_key_path" {
  description = "Path to SSH private key corresponding to the public key in public_key_path"
}

variable "cert_owner" {
  description = "The OS user to be made the owner of the local copy of the vault certificates. Should usually be set to the user operating the tool."
}

variable "cert_org_name" {
  description = "The organization to associate with the vault certificates."
  default = "Example Co."
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

variable "network_id" {
  description = <<DESCRIPTION
Ethereum network ID, also used in naming some resources for uniqueness.
Must be unique amongst networks in the same AWS account and launched with this tool.
Ideally is globally unique amongst ethereum and quorum networks.
DESCRIPTION
  default = 64813
}

variable "force_destroy_s3_buckets" {
  description = "Whether or not to force destroy s3 buckets. Set to true for an easily destroyed test environment. DO NOT set to true for a production environment."
  default     = false
}

variable "quorum_azs" {
  description = "Mapping from AWS region to AZs to utilize in that region."
  type        = "map"
  default     = {
    # Virginia
    us-east-1      = ["us-east-1a", "us-east-1b", "us-east-1c"]
    # Ohio
    us-east-2      = ["us-east-2a", "us-east-2b", "us-east-2c"]
    # California
    us-west-1      = ["us-west-1a", "us-west-1b", "us-west-1c"]
    # Oregon
    us-west-2      = ["us-west-2a", "us-west-2b", "us-west-2c"]
    # Frankfurt
    eu-central-1   = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
    # Ireland
    eu-west-1      = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
    # London
    eu-west-2      = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
    # Paris
    eu-west-3      = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
    # Mumbai
    ap-south-1     = ["ap-south-1a", "ap-south-1b"]
    # Tokyo
    ap-northeast-1 = ["ap-northeast-1a", "ap-northeast-1b", "ap-northeast-1c"]
    # Seoul
    ap-northeast-2 = ["ap-northeast-1a", "ap-northeast-1b"]
    # Singapore
    ap-southeast-1 = ["ap-southeast-1a", "ap-southeast-1b"]
    # Sydney
    ap-southeast-2 = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
    # Canada
    ca-central-1   = ["ca-central-1a", "ca-central-1b"]
    # South America
    sa-east-1      = ["sa-east-1a", "sa-east-1b", "sa-east-1c"]
  }
}

variable "quorum_amis" {
  type = "map"
}

variable "vault_amis" {
  type = "map"
}

variable "bootnode_amis" {
  type = "map"
}

variable "vault_cluster_size" {
  default = 3
}

variable "vault_instance_type" {
  default = "t2.micro"
}

variable "consul_cluster_size" {
  default = 3
}

variable "consul_instance_type" {
  default = "t2.micro"
}

variable "bootnode_cluster_size" {
  default = 1
}

variable "bootnode_instance_type" {
  default = "t2.small"
}

variable "quorum_node_instance_type" {
  default = "t2.small"
}

variable "num_maker_nodes" {
  description = "The number of maker nodes in the quorum cluster"
}

variable "num_validator_nodes" {
  description = "The number of validator nodes in the quorum cluster"
}

variable "num_observer_nodes" {
  description = "The number of observer nodes in the quorum cluster"
}

variable "vote_threshold" {
  description = "The number of votes needed to confirm a block. This should be more than half of the number of validator nodes."
}
