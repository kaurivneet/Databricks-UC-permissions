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
| [databricks_schema.uc_schema](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/schema) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog_name"></a> [catalog\_name](#input\_catalog\_name) | n/a | `string` | n/a | yes |
| <a name="input_databricks_workspace_token"></a> [databricks\_workspace\_token](#input\_databricks\_workspace\_token) | n/a | `string` | n/a | yes |
| <a name="input_databricks_workspace_url"></a> [databricks\_workspace\_url](#input\_databricks\_workspace\_url) | n/a | `string` | n/a | yes |
| <a name="input_schema_comment"></a> [schema\_comment](#input\_schema\_comment) | n/a | `string` | n/a | yes |
| <a name="input_schema_name"></a> [schema\_name](#input\_schema\_name) | n/a | `string` | n/a | yes |
| <a name="input_schema_owner"></a> [schema\_owner](#input\_schema\_owner) | n/a | `string` | n/a | yes |
| <a name="input_schema_properties"></a> [schema\_properties](#input\_schema\_properties) | n/a | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_schema_id"></a> [schema\_id](#output\_schema\_id) | n/a |
<!-- END_TF_DOCS -->