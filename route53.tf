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
