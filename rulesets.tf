resource "cloudflare_ruleset" "firewall_custom" {
  count   = length(var.firewall_custom_rules) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "default"
  kind    = "zone"
  phase   = "http_request_firewall_custom"
  rules   = var.firewall_custom_rules
}

resource "cloudflare_ruleset" "cache_settings" {
  count   = length(var.cache_settings_rules) > 0 ? 1 : 0
  zone_id = var.zone_id
  name    = "default"
  kind    = "zone"
  phase   = "http_request_cache_settings"
  rules   = var.cache_settings_rules
}
