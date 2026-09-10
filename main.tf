resource "cloudflare_zone_setting" "this" {
  for_each   = var.settings
  zone_id    = var.zone_id
  setting_id = each.key
  value      = each.value
}
