variable tenant_id {
  type        = string
  description = "The tenant_id is used to set the es_root_parent_id value for the enterprise_scale module."
  default     = "e9e7e695-ae50-4a53-8f15-1f30bd9a2886"
}

# Map of the remote data state filled by the rover at runtime
variable lowerlevel_storage_account_name {}
variable lowerlevel_container_name {}
variable lowerlevel_key {} # Keeping the key for the lower level0 access
variable lowerlevel_resource_group_name {}


# Set of variables for the CAF foundations landing zone
variable tags {
  type    = map
  default = {}
}

variable global_settings {
  type    = map
  default = {}
}

variable prefix {
  description = "(Optional) By default CAF Foundation gets the prefix from the launchpad. You can overwride it by setting a value."
  default     = "cuzza"
}