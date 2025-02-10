provider "aws" {
  region = "us-east-1"  
}

resource "aws_s3_bucket" "website1" {
  bucket = "my-static-website-bucket-00001"

  tags = {
    Name        = "MyStaticWebsite-1"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "website-1" {
  bucket = aws_s3_bucket.website1.id

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.website1.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.website1.id}/*"
    }
  ]
}
EOF
}


resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website1.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}
