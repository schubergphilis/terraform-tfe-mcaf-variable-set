variable "description" {
  type        = string
  description = "Description of the variable set."
}

variable "global" {
  type        = bool
  default     = false
  description = "Whether the variable set applies to all workspaces in the organization."

  validation {
    condition     = !var.global || var.parent_project_id == null
    error_message = "If 'global' is set to true, then 'parent_project_id' must not be set."
  }
}

variable "name" {
  type        = string
  description = "Name of the variable set."
}

variable "organization" {
  type        = string
  default     = null
  description = "Name of the organization. If omitted, organization must be defined in the provider config."
}

variable "parent_project_id" {
  type        = string
  default     = null
  description = "ID of the project that should own the variable set. If set, then var.global must be false. To assign whether a variable set should be applied to a project, use the tfe_project_variable_set resource."
}

variable "priority" {
  type        = bool
  default     = false
  description = "Whether the variables in this set can be over-written by more specific scopes including values set on the command line."
}

variable "variables" {
  type = map(object({
    category    = string
    description = optional(string, null)
    hcl         = optional(bool, false)
    sensitive   = optional(bool, false)
    value       = string
  }))
  description = "Map of variables."
}
