variable "name" {
  description = "The name of the security group."
  default     = "ssh_security_group_arthurmsb"
}

variable "description" {
  description = "The description of the security group."
  default     = "Allow SSH inbound traffic"
}

variable "from_port" {
  description = "The start port for ingress rules."
  default     = 22
}

variable "to_port" {
  description = "The end port for ingress rules."
  default     = 22
}

variable "protocol" {
  description = "The protocol for ingress rules."
  default     = "tcp"
}

variable "cidr_blocks" {
  description = "List of CIDR blocks to allow traffic from."
  default     = ["0.0.0.0/0"]
}
