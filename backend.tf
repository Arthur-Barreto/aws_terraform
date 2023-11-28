terraform {
  backend "s3" {
    bucket = "arthurmsbucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
