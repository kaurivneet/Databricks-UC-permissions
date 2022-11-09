<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks.workspace"></a> [databricks.workspace](#provider\_databricks.workspace) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_grants.uc_schema_grants](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/grants) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databricks_workspace_token"></a> [databricks\_workspace\_token](#input\_databricks\_workspace\_token) | n/a | `string` | n/a | yes |
| <a name="input_databricks_workspace_url"></a> [databricks\_workspace\_url](#input\_databricks\_workspace\_url) | n/a | `string` | n/a | yes |
| <a name="input_schema_group_permissions"></a> [schema\_group\_permissions](#input\_schema\_group\_permissions) | n/a | <pre>set(object({<br>    principal  = string<br>    privileges = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_schema_name"></a> [schema\_name](#input\_schema\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->