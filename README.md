# Terraform AzureRM Keyvault Secrets Module

This is a Terraform module for simple writing and reading secrets from an Azure Key Vault.

## Usage

Write secrets to Key Vault:

```terraform
resource "azurerm_key_vault" "example" {
  # your key vault
}

module "secrets" {
  source  = "zodiac403/key-vault-secrets/azurerm"
  version = "1.0.0"

  key_vault_id  = azurerm_key_vault.example.id
  input_secrets = {
    db-connection-string = "[secret connection string]",
    db-password          = "[secret database password]",
  }
  input_tags    = {
    stage = "example",
  }
}
```

Read secrets from Key Vault:

```terraform
module "secrets" {
  source  = "zodiac403/key-vault-secrets/azurerm"
  version = "1.0.0"

  key_vault_id   = azurerm_key_vault.example.id
  output_secrets = {
    db_connection_string = "db-connection-string",
    db_password          = "db-password"
  }
}

output "db_connection_string" {
  value = module.secrets.from_key_fault.db_connection_string
}

output "db_password" {
  value = module.secrets.from_key_fault.db_password
}
```

## References

- https://www.terraform.io/language/modules/develop
- https://www.terraform.io/registry/modules/publish
