
// Stores the paths of images stored in s3
resource "aws_dynamodb_table" "s3_imagepath_table" {
  name         = var.table_name
  billing_mode = var.table_billing_mode
  hash_key     = "animal_name"
  range_key    = "image_uri"
  attribute {
    name = "animal_name"
    type = "S"
  }
  attribute {
    name = "image_uri"
    type = "S"
  }
  tags = {
    environment = "${var.environment}"
  }
}
