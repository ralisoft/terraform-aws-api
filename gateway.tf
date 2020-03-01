#--------------------------------------------------------------
# API Gateway
#--------------------------------------------------------------

resource "aws_api_gateway_rest_api" "api" {
  name = "${var.name}-${var.environment}"
}

resource "aws_api_gateway_domain_name" "api" {
  regional_certificate_arn = var.certificate_arn
  domain_name              = "${var.route53_subdomain}.${var.route53_domain}"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}