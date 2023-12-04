#### availability_zone ####

variable "zone" {
  description = "value of availability zone"
  type        = string
  default     = "us-east-1a"
}

####### VPC #######

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

####### GATEWAY #######

variable "tags_igw" {
  description = "Tags for the IGW."
  default = {
    Name = "IGW_arthurmsb"
  }

}

####### SUBNET #######

variable "subnet_count" {
  description = "The number of subnets to create."
  type        = map(number)
  default = {
    "public"  = 2,
    "private" = 2
  }

}

variable "private_subnet_cidr_blocks" {
  description = "The CIDR blocks for the private subnets."
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24"
  ]

}

variable "public_subnet_cidr_blocks" {
  description = "The CIDR blocks for the public subnets."
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]

}

##### security_group #####

variable "ec2_sg_name" {
  description = "The name of the security group."
  default     = "ec2_security_group_arthurmsb"
}

variable "description" {
  description = "The description of the security group."
  default     = "Allow SSH inbound traffic"
}

variable "ssh_port_in" {
  description = "The start port for ingress rules."
  default     = 22
}

variable "ssh_port_end" {
  description = "The end port for ingress rules."
  default     = 22
}

variable "http_port_in" {
  description = "The start port for ingress rules."
  default     = 80

}

variable "http_port_out" {
  description = "The end port for ingress rules."
  default     = 80

}

variable "https_port_in" {
  description = "The start port for ingress rules."
  default     = 443

}

variable "https_port_out" {
  description = "The end port for ingress rules."
  default     = 443

}

variable "protocol" {
  description = "The protocol for ingress rules."
  default     = "tcp"
}

variable "cidr_blocks" {
  description = "List of CIDR blocks to allow traffic from."
  default     = ["0.0.0.0/0"]
}

variable "ec2_sg_tag" {
  description = "The tag for the security group."
  default = {
    Name = "ssh_security_group_arthurmsb"
  }

}

variable "rds_sg_name" {
  description = "The name of the security group."
  default     = "rds_security_group_arthurmsb"

}

variable "rds_sg_description" {
  description = "The description of the security group."
  default     = "Security group for RDS"

}

variable "rds_ingress_description" {
  description = "The description of the security group."
  default     = "Allow MySql traffic from only the EC2 instance"

}

variable "rds_port_in" {
  description = "The start port for ingress rules."
  default     = 3306

}

variable "rds_port_out" {
  description = "The end port for ingress rules."
  default     = 3306

}

variable "rds_tag" {
  description = "The tag for the security group."
  default = {
    Name = "rds_security_group_arthurmsb"
  }

}

###### db_subnet ######

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group."
  default     = "db_subnet_group_arthurmsb"

}

##### ssh_key_pair #####

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

##### rds_instance #####

variable "settings" {
  description = "The settings for the RDS instance."
  type        = map(any)
  default = {
    "database" = {
      engine              = "mysql"
      engine_version      = "5.7"
      instance_class      = "db.t2.micro"
      allocated_storage   = 10
      storage_type        = "gp2"
      db_name             = "appMegadados"
      skip_final_snapshot = true
    },
    "web_app" = {
      count         = 1
      instance_type = "t2.micro"
    }
  }

}

variable "db_username" {
  description = "Database username."
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database password."
  type        = string
  sensitive   = true

}

##### ec2_instance #####

variable "ami" {
  description = "The AMI ID for the EC2 instance."
  default     = "ami-03ae24afdb6541606"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance."
  default     = "t2.micro"
}

variable "tags" {
  description = "Tags for the EC2 instance."
  default = {
    Name = "Ec2_first_arthurmsb"
  }
}
