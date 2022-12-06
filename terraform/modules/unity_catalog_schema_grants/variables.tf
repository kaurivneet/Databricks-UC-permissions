variable "schema_name" {
  type = string
}

variable "schema_group_permissions" {
  type = set(object({
    principal  = string
    privileges = list(string)
  }))
}


variable "workspace_url" {
  type = string

}
variable "workspace_token" {
  type      = string
  sensitive = true
}
