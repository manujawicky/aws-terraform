# Provider
variable "aws_region" {}

# credential file
variable "cred_file" {}

# EC2 instance
variable "ami-id" {}
variable "instance_type" {}
variable "key_pair_name" {}

# S3
variable "bucket_name" {}