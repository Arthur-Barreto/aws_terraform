variable "cidr_block_vpc" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"

}

variable "tag_vpc" {
  description = "Tags for the VPC."
  default = {
    Name = "VPC_arthurmsb"
  }
}
