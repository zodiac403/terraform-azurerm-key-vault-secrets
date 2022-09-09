# copyright zodiac403@gmx.de, 2022, see `LICENSE`

variable "keyvault_id" {
  description = "Azure resource ID of the Key Vault. Expected format: `/subscriptions/ID/resourceGroups/NAME/providers/Microsoft.KeyVault/vaults/NAME`"
  type        = string
}

variable "input_secrets" {
  type        = map(string)
  description = "Secrets to write to the Key vault. Varaible accepts key value pairs of type `string: string` (key: Azure secret name, value: secret value)."
  default     = {}
}

variable "input_tags" {
  type        = map(string)
  description = "Add tags to secrets. Variable accepts key value pairs of type `string: string`"
  default     = {} # null
}

variable "output_secrets" {
  type        = map(string)
  description = "Secrets to read from the Key vault. Varaible accepts key value pairs of type `string: string` (key: Terraform output name, value: Azure secret name)."
  default     = {}
}
