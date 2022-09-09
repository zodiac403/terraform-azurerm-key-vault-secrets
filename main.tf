# copyright zodiac403@gmx.de, 2022, see `LICENSE`

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

resource "azurerm_key_vault_secret" "input" {
  key_vault_id = var.key_vault_id

  for_each = var.input_secrets
  name     = each.key
  value    = each.value

  tags = var.input_tags
}

data "azurerm_key_vault_secret" "output" {
  key_vault_id = var.key_vault_id

  for_each = var.output_secrets
  name     = each.value
}
