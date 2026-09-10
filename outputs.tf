output "zone_id" {
  description = "The zone ID that was configured"
  value       = var.zone_id
}

output "managed_keys" {
  description = "Keys of the managed DNS records"
  value       = keys(var.records)
}

output "record_ids" {
  description = "Map of record keys to IDs"
  value       = { for k, r in cloudflare_dns_record.this : k => r.id }
}

output "email_enabled" {
  description = "Whether Email Routing was enabled"
  value       = var.email_enabled
}

output "firewall_custom_id" {
  description = "Firewall custom ruleset ID"
  value       = try(cloudflare_ruleset.firewall_custom[0].id, null)
}

output "cache_settings_id" {
  description = "Cache settings ruleset ID"
  value       = try(cloudflare_ruleset.cache_settings[0].id, null)
}
