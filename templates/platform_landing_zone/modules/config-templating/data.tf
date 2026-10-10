module "regions" {
  source           = "git::https://avm.mirror.invalid/terraform-azurerm-avm-utl-regions.git?ref=v0.9.2-local"
  use_cached_data  = false
  enable_telemetry = var.enable_telemetry
}

data "azurerm_client_config" "current" {}
