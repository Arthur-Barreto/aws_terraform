variable "ami" {
  description = "The AMI ID for the EC2 instance."
  default     = "ami-0e783882a19958fff"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance."
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name for the EC2 instance."
  default     = "ssh_key_pair_arthurmsb"
}

variable "tags" {
  description = "Tags for the EC2 instance."
  default = {
    Name = "Ec2_first_arthurmsb"
  }
}

variable "security_group_name" {
  description = "value of security group name"
}