resource "databricks_schema" "uc_schema" {
  provider     = databricks.workspace
  catalog_name = var.catalog_name
  name         = var.schema_name
  owner        = var.schema_owner
  comment      = var.schema_comment
  properties   = var.schema_properties
}

  