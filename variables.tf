variable "app_name" {
  type    = string
  default = "app_name"
}

variable "business_unit" {
  type    = string
  default = "bu"
}

variable "context" {
  type    = string
  default = "it"
}

variable "custom_name_format" {
  type = list(string)
  validation {
    condition = (
      alltrue([for value in var.custom_name_format : contains(["resource_type", "app_name", "business_unit", "region", "environment", "padding", "context", "sub_resource_type"], value)])
    )
    error_message = "Name format must be a list with the following allowed values: 'resource_type', 'app_name','business_unit','region','environment','padding','context','sub_resource_type'"
  }
  default = ["sub_resource_type", "resource_type", "app_name", "environment", "region", "padding"]
}

variable "environment" {
  type = string
  validation {
    condition     = contains(["dev", "tst", "uat", "prd", "qa", "stg", "blu", "grn"], var.environment)
    error_message = "Environment must be one of the following values: 'dev','tst','uat','prd','qa','stg','blu','grn'"
  }
  default = "prd"
}

variable "least_to_most_naming_standard" {
  type        = bool
  default     = false
  description = "Set this to true if you would like to use the standard for least specific to most specific ordering"
}

variable "microsoft_caf_naming_standard" {
  type        = bool
  default     = false
  description = "Set this to true if you would like to use the standard found in the example on https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming"
}

variable "most_to_least_naming_standard" {
  type        = bool
  default     = false
  description = "Set this to true if you would like to use the standard for most specific to least specific ordering"
}

variable "prefix" {
  type        = list(string)
  default     = []
  description = "It is not recommended that you use prefix by azure you should be using a suffix for your resources."
}

variable "region" {
  type = map(string)
  default = {
    "name" = "eastus2"
    "slug" = "use2"
  }
}

variable "resource_type" {
  type    = string
  default = "app_service"
}

variable "sub_resource_type" {
  type    = string
  default = "user_assigned_identity"
}

variable "suffix" {
  type        = list(string)
  default     = []
  description = "It is recommended that you specify a suffix for consistency. please use only lowercase characters when possible"
}

variable "unique-seed" {
  description = "Custom value for the random characters to be used"
  type        = string
  default     = ""
}

variable "unique-length" {
  description = "Max length of the uniqueness suffix to be added"
  type        = number
  default     = 4
}

variable "unique-include-numbers" {
  description = "If you want to include numbers in the unique generation"
  type        = bool
  default     = true
}












variable "padding" {
  type    = string
  default = "01"
}

variable "separator" {
  type    = string
  default = "-"
  validation {
    condition     = contains(["-", "_"], var.separator)
    error_message = "Separator must be one of the following values: '-','_'"
  }
}
