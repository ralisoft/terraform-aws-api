# --------------------------------------------------------------
#  AWS
# --------------------------------------------------------------
variable "aws_region" {
  type = string

  default = "us-east-1"
}

# --------------------------------------------------------------
#  API Gateway
# --------------------------------------------------------------

# --------------------------------------------------------------
#  Route53
# --------------------------------------------------------------
variable "route53_enabled" {
  type = bool

  default = true
}

variable "route53_domain" {
  type = string
}

variable "route53_subdomains" {
  type = list
}

# --------------------------------------------------------------
#  Misc
# --------------------------------------------------------------
variable "tags" {
  type = map

  default = {}
}

variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "enabled" {
  type = bool

  default = true
}

variable "certificate_arn" {
  type = string
}