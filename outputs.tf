# copyright zodiac403@gmx.de, 2022, see `LICENSE`

output "from_key_vault" {
  description = "Key value pairs of format `string: string`, where `key` is the key of the input variable and `value` is the secret value from the key vault"
  sensitive   = true

  value = {
    for key, secret in data.azurerm_key_vault_secret.output : key => secret.value
  }
}
