#Defining grants to Unity catalog schema created by above resource
resource "databricks_grants" "uc_schema_grants" {
  provider = databricks.workspace
  schema   = var.schema_name
  dynamic "grant" {
    for_each = var.schema_group_permissions
    content {
      principal  = grant.value.principal
      privileges = grant.value.privileges
    }
  }

}
