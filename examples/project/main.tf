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

# Optionally, you can assign access of the variable set to a project.
resource "tfe_project_variable_set" "test" {
  project_id      = tfe_project.default.id
  variable_set_id = module.tfe_variable_set["domain"].id
}
