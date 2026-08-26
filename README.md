# tf-module-cloudflare-zone

Terraform module that manages `cloudflare_zone_setting` resources via a `settings` map — registry-ready extraction of `tf-deploy-cloudflare/modules/zone`.

## Usage

```hcl
module "zone_essinghigh" {
  source  = "terraform.essinghigh.dev/essinghigh-org/zone/cloudflare"
  version = "~> 0.1"

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
