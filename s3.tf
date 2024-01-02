// Bucket for the staitc website files
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.s3_static_website_bucket_name
}

resource "aws_s3_bucket" "images_bucket" {
  bucket = var.s3_images_bucket_name
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.static_website_bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.static_website_bucket.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_policy" "s3_bucket_policy_cloudfront" {
  bucket = aws_s3_bucket.static_website_bucket.id
  policy = data.aws_iam_policy_document.iam_policy_document_allow_cloudfront.json
}

data "aws_iam_policy_document" "iam_policy_document_allow_cloudfront" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.static_website_bucket.arn}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = ["${aws_cloudfront_distribution.static_website_distribution.arn}"]
    }
  }
}