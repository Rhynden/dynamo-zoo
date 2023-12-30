variable "domain_name" {
  description = "Domain name of the website"
  type        = string
}

variable "alternative_domain_names" {
  description = "Alternative domain names of the website"
  type        = list(string)
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