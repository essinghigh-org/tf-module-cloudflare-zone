resource "cloudflare_dns_record" "this" {
  for_each = var.records
  zone_id  = var.zone_id
  type     = each.value.type
  name     = each.value.name
  content  = each.value.content
  priority = each.value.priority
  proxied  = each.value.proxied
  ttl      = each.value.ttl
  comment  = each.value.comment
  data     = each.value.data
}
