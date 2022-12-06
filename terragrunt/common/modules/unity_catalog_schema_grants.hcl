locals {
  #   module_url     = "git::ssh://git@github.com/Energy-Queensland-Limited/Enterprise-Info-Databricks-Platform.git//terraform/modules/workspace_settings"
  #   module_version = "account-v0.0.1"
  source_path = "${get_path_to_repo_root()}//terraform/modules/unity_catalog_schema_grants"
}

terraform {
  source = local.source_path
  extra_arguments "retry_lock" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=15m"]
  }
}