// changed resource to data to use existing rg
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
 
data "azurerm_subscription" "current" {
}
 
data "azurerm_user_assigned_identity" "msi" {
  name                = var.managed_identity_name
  resource_group_name = var.managed_identity_rg
}
 
resource "random_string" "test_id" {
  length    = 6
  min_lower = 6
}

provider "github" {
  owner = "Rahulsurya1"
  token = "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"
}
 
 
module "aci" {
  source                  = "git::https://<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>github.com/Rahulsurya1/checkaccesstoken.git
  aci_name                = var.aci_name
  resource_group          = data.azurerm_resource_group.rg
  aci_subnet_ids          = var.aci_subnets
  managed_identity        = data.azurerm_user_assigned_identity.msi
  use_registry_credential = true
  tags                    = var.tags
  enable_debug            = false
 
  enable_azure_monitoring_metrics = true
  azure_metrics_exporter_prometheus_jobs = templatefile("manifests/jobs.yaml", {
    subscription_id = data.azurerm_subscription.current.subscription_id
  })
 
  # fluentd parameters:
  # fluentd_enrich_and_filter_config = templatefile("manifests/fluentd.conf", {})
  enable_diagnostic_event_hub = true
  diag_event_hub = {
    subnet_id = var.eventhub_subnet_id
    # Only needed to ensure unicity of cicd automated testings
    name_suffix = random_string.test_id.result
  }
 
  dt_config = {
    env             = var.dynatrace_env
    ingestion_token = var.dynatrace_token
    metrics_dimensions = {
      z_env      = var.environment
      z_team     = var.tags.team
      z_activity = var.tags.activity
    }
  }
}
