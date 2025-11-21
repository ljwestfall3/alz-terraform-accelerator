module "hub_and_spoke_vnet" {
  source  = "git::https://avm.mirror.invalid/terraform-azurerm-avm-ptn-alz-connectivity-hub-and-spoke-vnet.git?ref=v0.16.2-local"

  count = local.connectivity_hub_and_spoke_vnet_enabled ? 1 : 0

  hub_and_spoke_networks_settings = local.hub_and_spoke_networks_settings
  hub_virtual_networks            = local.hub_virtual_networks
  enable_telemetry                = var.enable_telemetry
  tags                            = coalesce(module.config.outputs.connectivity_tags, module.config.outputs.tags)

  providers = {
    azurerm = azurerm.connectivity
    azapi   = azapi.connectivity
  }
}
