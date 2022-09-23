resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-bootcamp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dns_prefix = "aks-bootcamp"

  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "aks_acr" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id

  depends_on = [
  azurerm_container_registry.acr,
  azurerm_kubernetes_cluster.aks
  ]
}