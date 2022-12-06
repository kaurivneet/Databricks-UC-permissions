locals {
  #change the bucket name when decided 
  # metastore_name = "eq_data_metastore"

}
include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

# schema module
include "module" {
  path = "${get_path_to_repo_root()}/terragrunt/common/modules/unity_catalog_object_schema.hcl"
}


inputs = {
  catalog_name      = "terraform_test"
  schema_comment    = "Schema to test tf config"
  schema_name       = "bronze_test"
  schema_owner      = "ivneet.kaur@versent.com.au"
  schema_properties = { "sensitive" : "True" }
}