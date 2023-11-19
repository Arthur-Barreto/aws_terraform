variable "vpc_id" {
  description = "value of the vpc_id"
}

variable "tags_igw" {
  description = "Tags for the IGW."
  default = {
    Name = "IGW_arthurmsb"
  }

}
