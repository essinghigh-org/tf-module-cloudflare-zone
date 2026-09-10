# tf-module-cloudflare-zone

Terraform module that manages `cloudflare_zone_setting` resources via a `settings` map.

## Usage

```hcl
module "zone" {
  source  = "github.com/essinghigh-org/tf-module-cloudflare-zone"

  zone_id = var.zone_id
  settings = {
    ssl             = "full"
    min_tls_version = "1.3"
  }
}
```

Only include non-default settings you want to enforce.

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
