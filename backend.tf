resource "aws_s3_bucket" "my_bucket" {
  bucket = "arthurmsbucket"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "s3_object" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "testobject"
  source = "terraform.tfstate"

}
