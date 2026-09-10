# tf-module-cloudflare-zone

Terraform module that manages everything about a Cloudflare zone in one place: zone settings, DNS records, Email Routing catch-all, and firewall/cache rulesets.

## Usage

```hcl
module "zone" {
  source = "github.com/essinghigh-org/tf-module-cloudflare-zone"

  zone_id = var.zone_id

  settings = {
    ssl             = "full"
    min_tls_version = "1.3"
  }

  records = {
    cname_www = {
      type    = "CNAME"
      name    = "www.example.com"
      content = "example.com"
      proxied = true
      ttl     = 1
    }
  }

  email_enabled = true
  catch_all_action = {
    type  = "forward"
    value = ["admin@example.com"]
  }

  firewall_custom_rules = []
  cache_settings_rules  = []
}
```

Only include non-default settings you want to enforce. Omit a feature's inputs to leave it unmanaged.

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
