variable "algorithm" {
  description = "The algorithm to use for the SSH key pair."
  default     = "RSA"
}

variable "rsa_bits" {
  description = "The number of bits for the RSA key pair."
  default     = 2048
}

variable "key_name" {
  description = "The name of the SSH key pair."
  default     = "ssh_key_pair_arthurmsb"
}
