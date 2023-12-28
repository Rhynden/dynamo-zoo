variable "domain_name" {
  description = "Domain name of the website"
  type        = string
}

variable "alternative_domain_names" {
  description = "Alternative domain names of the website"
  type        = list(string)
}
