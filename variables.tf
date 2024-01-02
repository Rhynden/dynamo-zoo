variable "domain_name" {
  description = "Domain name of the website"
  type        = string
}

variable "api_domain_name" {
  description = "API domain name of the website"
  type        = string
}

variable "alternative_domain_names" {
  description = "Alternative domain names of the website"
  type        = list(string)
}

variable "s3_static_website_bucket_name" {
  description = "Contains static website files (html, js, css)"
  type        = string
}

variable "s3_images_bucket_name" {
  description = "Contains images to be served/queried"
  type        = string
}

variable "table_name" {
  description = "Dynamodb table name (space is not allowed)"
  default     = "animals"
}

variable "table_billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity."
  default     = "PAY_PER_REQUEST"
}

variable "environment" {
  description = "Name of environment"
  default     = "dev"
}