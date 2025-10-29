// Stores the actual images to be retrieved by a lambda
resource "aws_s3_bucket" "image_bucket" {
  bucket = "fb-dynamozoo-image-bucket"
}

// Store the files of the website to be displayed to the client
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "fb-dynamozoo-static-website-bucket"
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership_controls" {
  bucket = aws_s3_bucket.static_website_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "static_website_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls]

  bucket = aws_s3_bucket.static_website_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "static_website_bucket_configuration" {
  bucket = aws_s3_bucket.static_website_bucket.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}