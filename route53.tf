#--------------------------------------------------------------
# Route 53 Records
#--------------------------------------------------------------
resource "aws_route53_record" "main" {
  count = var.route53_enabled && var.enabled ? length(local.aliases) : 0

  zone_id = element(data.aws_route53_zone.domain.*.zone_id, 0)
  name    = element(local.aliases, count.index)
  type    = "A"

  alias {
    name                   = aws_api_gateway_domain_name.api[count.index].regional_domain_name
    zone_id                = aws_api_gateway_domain_name.api[count.index].regional_zone_id
    evaluate_target_health = true
  }
}