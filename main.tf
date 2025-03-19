resource "tfe_variable_set" "default" {
  description       = var.description
  global            = var.global
  name              = var.name
  organization      = var.organization
  parent_project_id = var.parent_project_id
  priority          = var.priority
}

resource "tfe_variable" "default" {
  for_each = var.variables

  category        = each.value.category
  description     = each.value.description
  hcl             = each.value.hcl
  key             = each.key
  sensitive       = each.value.sensitive
  value           = each.value.value
  variable_set_id = tfe_variable_set.default.id
}
