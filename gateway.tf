#--------------------------------------------------------------
# API Gateway
#--------------------------------------------------------------

resource "aws_api_gateway_rest_api" "api" {
  name = "${var.name}-${var.environment}"
}

resource "aws_api_gateway_domain_name" "api" {
  count       = var.enabled ? length(local.aliases) : 0
  domain_name = element(local.aliases, count.index)

  regional_certificate_arn = var.certificate_arn

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}