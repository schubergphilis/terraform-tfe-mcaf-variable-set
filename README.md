# terraform-tfe-mcaf-variable-set

Terraform module to create HCP Terraform variable sets.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.62 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.62 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.default](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.default](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the variable set. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the variable set. | `string` | n/a | yes |
| <a name="input_variables"></a> [variables](#input\_variables) | Map of variables. | <pre>map(object({<br/>    category    = string<br/>    description = optional(string, null)<br/>    hcl         = optional(bool, false)<br/>    sensitive   = optional(bool, false)<br/>    value       = string<br/>  }))</pre> | n/a | yes |
| <a name="input_global"></a> [global](#input\_global) | Whether the variable set applies to all workspaces in the organization. | `bool` | `false` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Name of the organization. If omitted, organization must be defined in the provider config. | `string` | `null` | no |
| <a name="input_parent_project_id"></a> [parent\_project\_id](#input\_parent\_project\_id) | ID of the project that should own the variable set. If set, then var.global must be false. | `string` | `null` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Whether the variables in this set can be over-written by more specific scopes including values set on the command line. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The variable set ID. |
<!-- END_TF_DOCS -->