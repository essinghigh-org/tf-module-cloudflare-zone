variable "zone_id" {
  description = "Cloudflare zone ID whose settings are managed"
  type        = string
}

# Use cloudflare_zone_setting per setting_id - one resource per setting via for_each
variable "settings" {
  description = "Map of setting_id -> value (string or number). Only include non-defaults you want to enforce."
  type        = map(any)
  default     = {}
}

variable "records" {
  description = "Map of DNS records to manage. For MX/SRV set priority/data accordingly. Keys are stable TF keys."
  type = map(object({
    type     = string
    name     = string
    content  = optional(string)
    priority = optional(number)
    proxied  = optional(bool)
    ttl      = optional(number, 1)
    comment  = optional(string)
    data = optional(object({
      priority = optional(number)
      weight   = optional(number)
      port     = optional(number)
      target   = optional(string)
    }))
  }))
  default = {}
}

variable "email_enabled" {
  description = "Whether to manage the catch-all rule in this zone"
  type        = bool
  default     = true
}

variable "catch_all_action" {
  description = "Catch-all action: type drop/forward and optional value list for forward targets"
  type = object({
    type  = string
    value = optional(list(string))
  })
  default = null

  validation {
    condition     = var.catch_all_action == null || contains(["drop", "forward"], var.catch_all_action.type)
    error_message = "catch_all_action.type must be drop or forward."
  }
}

variable "firewall_custom_rules" {
  description = "List of http_request_firewall_custom rules (each with description, expression, action, action_parameters)"
  type        = any
  default     = []
}

variable "cache_settings_rules" {
  description = "List of http_request_cache_settings rules"
  type        = any
  default     = []
}
