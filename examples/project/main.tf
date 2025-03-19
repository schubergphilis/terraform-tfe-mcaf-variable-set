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
  source = "../.."

  description       = each.value.description
  global            = try(each.value.global, false)
  name              = each.key
  variables         = each.value.variables
  parent_project_id = tfe_project.default.id
}

# Optionally, you can assign access of the variable set to a project.
resource "tfe_project_variable_set" "test" {
  variable_set_id = module.tfe_variable_set.id
  project_id      = tfe_project.default.id
}
