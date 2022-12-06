locals {
  backend_bucket   = "terraform-state-dbr"
  aws_region       = "ap-southeast-2"
  dynamodb_table   = "terraform-state-dbr"
  role_arn         = "arn:aws:iam::099423962904:role/instance-profile-databricks-shared-S3"
  module_vars      = read_terragrunt_config(find_in_parent_folders("module.hcl", "i-dont-exist.hcl"), { locals = {}, inputs = {} })
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl", "i-dont-exist.hcl"), { locals = {}, inputs = {} })
  environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl", "i-dont-exist.hcl"), { locals = {}, inputs = {} })
  account_vars     = read_terragrunt_config(find_in_parent_folders("account.hcl", "i-dont-exist.hcl"), { locals = {}, inputs = {} })

}

inputs = merge(
  local.module_vars.locals,
  local.module_vars.inputs,
  local.region_vars.locals,
  local.region_vars.inputs,
  local.environment_vars.locals,
  local.environment_vars.inputs,
  local.account_vars.locals,
  local.account_vars.inputs,
)

remote_state {
  backend = "local"
  config  = {}
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


# remote_state {
#   backend                         = "s3"
#   disable_dependency_optimization = true
#   config = {
#     encrypt               = true
#     bucket                = "${local.backend_bucket}"
#     key                   = "${path_relative_to_include()}/terraform.tfstate"
#     region                = local.aws_region
#     dynamodb_table        = local.dynamodb_table
#     role_arn              = local.role_arn
#     disable_bucket_update = true
#   }
#   generate = {
#     path      = "backend.tf"
#     if_exists = "overwrite_terragrunt"
#   }
# }