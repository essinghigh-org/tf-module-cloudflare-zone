resource "cloudflare_email_routing_catch_all" "this" {
  count    = var.email_enabled && var.catch_all_action != null ? 1 : 0
  zone_id  = var.zone_id
  name     = "catch-all"
  enabled  = true
  matchers = [{ type = "all" }]
  actions = [{
    type  = var.catch_all_action.type
    value = var.catch_all_action.value
  }]
}
