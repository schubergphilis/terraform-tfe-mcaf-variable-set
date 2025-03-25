locals {
  variable_sets = {
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

provider "tfe" {}

resource "tfe_project" "default" {
  name = "projectname"
}

module "tfe_variable_set" {
  for_each = local.variable_sets

  source = "../.."

  description       = each.value.description
  name              = each.key
  parent_project_id = tfe_project.default.id
  priority          = try(each.value.global, false)
  variables         = each.value.variables
}
