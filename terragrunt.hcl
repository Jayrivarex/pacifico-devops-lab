# Configuración global del backend para Terragrunt adaptada al Sandbox de Pacífico
remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    resource_group_name  = "1-18b45b4a-playground-sandbox"
    storage_account_name = "pacificostatelem01" # Nombre único para el almacenamiento de estado
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  features {}
}
EOF
}