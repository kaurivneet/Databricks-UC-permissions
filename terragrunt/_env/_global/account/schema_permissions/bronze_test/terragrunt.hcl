locals {
  #change the bucket name when decided 
  # metastore_name = "eq_data_metastore"

}
include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}
dependencies {
  paths = [
    "${get_repo_root()}/terragrunt/${include.root.inputs.environment}/_global/account/schema/bronze_test"
  ]
}
dependency "schema" {
  config_path  = "${get_repo_root()}/terragrunt/${include.root.inputs.environment}/_global/account/schema/bronze_test"
  skip_outputs = false
  mock_outputs = {
    schema_id = 12456
  }
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs_merge_strategy_with_state  = "shallow"
}

# schema module
include "module" {
  path = "${get_path_to_repo_root()}/terragrunt/common/modules/unity_catalog_schema_grants.hcl"
}


inputs = {
  schema_name = dependency.schema.outputs.schema_id
  schema_group_permissions = ([
    {
      principal  = "developers"
      privileges = ["USAGE"]
  }])

}