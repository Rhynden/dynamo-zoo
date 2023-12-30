resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

# Cloudfront alternate domain name
resource "aws_route53_record" "route53_record_cloudfront" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.static_website_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.static_website_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "api_gateway_record" {
  name    = aws_api_gateway_domain_name.api_gateway_domain_name.domain_name
  type    = "A"
  zone_id = aws_route53_zone.primary.id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.api_gateway_domain_name.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.api_gateway_domain_name.cloudfront_zone_id
  }
}
