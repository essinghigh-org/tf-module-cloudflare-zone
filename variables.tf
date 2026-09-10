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
