#--------------------------------------------------------------
# Route 53 Records
#--------------------------------------------------------------
resource "aws_route53_record" "main" {
  count = var.route53_enabled && var.enabled ? length(local.aliases) : 0

  zone_id = element(data.aws_route53_zone.domain.*.zone_id, 0)
  name    = element(local.aliases, count.index)
  type    = "A"

  alias {
    name                   = element(aws_api_gateway_domain_name.api.regional_domain_name, count.index)
    zone_id                = element(aws_api_gateway_domain_name.api.regional_zone_id, count.index)
    evaluate_target_health = true
  }
}