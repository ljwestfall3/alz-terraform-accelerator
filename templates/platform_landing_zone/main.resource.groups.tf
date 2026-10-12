module "resource_groups" {
  source  = "git::https://avm.mirror.invalid/terraform-azurerm-avm-res-resources-resourcegroup.git?ref=v0.2.1-local"

  for_each = { for key, value in module.config.outputs.connectivity_resource_groups : key => value if try(value.settings.enabled, true) }

  name             = each.value.name
  location         = each.value.location
  enable_telemetry = var.enable_telemetry
  tags             = try(each.value.tags, null) == null ? module.config.outputs.tags : each.value.tags

  providers = {
    azurerm = azurerm.connectivity
  }
}
