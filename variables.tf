variable "app_name" {
  type        = string
  default     = "app_name"
  description = "Set this value to provide an app name that the resource relates to"
}

variable "business_unit" {
  type        = string
  default     = "bu"
  description = "Set this value to describe a business unit if needed"
}

variable "context" {
  type        = string
  default     = "it"
  description = "Set this value to provide context to the resource. This would be used for things like 'hub', 'iam', 'mgmt' as it relates to the CAF platform landing zones. \n https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/"
}

variable "custom_name_format" {
  type = list(string)
  validation {
    condition = (
      alltrue([for value in var.custom_name_format : contains(["resource_type", "app_name", "business_unit", "region", "environment", "padding", "context", "sub_resource_type"], value)])
    )
    error_message = "Name format must be a list with the following allowed values: 'resource_type', 'app_name','business_unit','region','environment','padding','context','sub_resource_type'"
  }
  default     = ["sub_resource_type", "resource_type", "app_name", "environment", "region", "padding"]
  description = "Name format must be a list with the following allowed values: 'resource_type', 'app_name','business_unit','region','environment','padding','context','sub_resource_type'"
}

variable "environment" {
  type = string
  validation {
    condition     = contains(["dev", "tst", "uat", "prd", "qa", "stg", "blu", "grn"], var.environment)
    error_message = "Environment must be one of the following values: 'dev','tst','uat','prd','qa','stg','blu','grn'"
  }
  default     = "prd"
  description = "Environment must be one of the following values: 'dev','tst','uat','prd','qa','stg','blu','grn'"
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

variable "padding" {
  type        = string
  default     = "01"
  description = "If additional padding is needed to itterate over resources"
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
  description = "Provide a region and region 'slug'. Slug is used to shorten the name in to 4 character references for the region to provide a shorter name."
}

variable "resource_type" {
  type        = string
  default     = "app_service"
  description = "This value must always be set. The name must one of the resource types shown in the outputs."
}

variable "separator" {
  type    = string
  default = "-"
  validation {
    condition     = contains(["-", "_"], var.separator)
    error_message = "Separator must be one of the following values: '-','_'"
  }
  description = "If you would like to choose between setting '-' (default) or '_' to separate parts of your resource name. Resources that do not allow '-' automatically ommit this variable."
}

variable "sub_resource_type" {
  type        = string
  default     = "user_assigned_identity"
  description = "This value is optional. The name must one of the resource types shown in the outputs. Sub resource types are usually attached to the resource_type like a Public IP, NIC, managed identity etc."
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
