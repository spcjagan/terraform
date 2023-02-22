provider "aws" {
    access_key = "AKIAUJWZEZKPWNFG37PZ"
    secret_key = "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"
    region = "ap-south-1"
  
}

resource "aws_s3_bucket" "bucket"{
    bucket = "my-terra-bucket"  

}

resource "aws_s3_bucket_acl" "bucket01" {
 bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}


resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}