locals {
  variable_sets = {
    "global" = {
      description = "global variables"
      global      = true

      variables = {
        "AWS_DEFAULT_REGION" = {
          value    = "eu-west-1"
          category = "env"
        }
      }
      "domain" = {
        description = "domain variables"

        variables = {
          "domain" = {
            value    = "example.com"
            category = "terraform"
          }
        }
      }
    }
  }
}

provider "tfe" {}

module "tfe_variable_set" {
  for_each = local.variable_sets

  source = "../.."

  description = each.value.description
  global      = try(each.value.global, false)
  name        = each.key
  priority    = try(each.value.global, false)
  variables   = each.value.variables
}
