locals {
  account_username = get_env("DATABRICKS_ACCOUNT_USERNAME")
  account_password = get_env("DATABRICKS_ACCOUNT_PASSWORD")
}
inputs = {
  databricks_host_account     = get_env("DATABRICKS_ACCOUNT_HOST")
  databricks_account_id       = get_env("DATABRICKS_ACCOUNT_ID")
  databricks_account_username = get_env("DATABRICKS_ACCOUNT_USERNAME")
  databricks_account_password = get_env("DATABRICKS_ACCOUNT_PASSWORD")
  basic_auth                  = base64encode("${local.account_username}:${local.account_password}")
  # strangely metastore creation is using workspace provider, certainly ODD!
  workspace_token = get_env("WORKSPACE_TOKEN")
  workspace_url   = get_env("WORKSPACE_URL")
}