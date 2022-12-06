variable "catalog_name" {
  type = string
}

variable "schema_comment" {
  type = string
}

variable "schema_name" {
  type = string
}

variable "schema_owner" {
  type = string
}


variable "schema_properties" {
  type = map(any)
}


variable "workspace_url" {
  type = string

}
variable "workspace_token" {
  type      = string
  sensitive = true
}

