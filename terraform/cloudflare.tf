resource "cloudflare_pages_project" "monorepo_standards" {
  account_id        = var.cloudflare_account_id
  name              = "monorepo-standards"
  production_branch = "main"

  build_config {
    build_command   = ""
    destination_dir = ""
    root_dir        = ""
  }

  deployment_configs {
    production {
      compatibility_date = "2024-01-01"
      fail_open          = false
    }
  }
}

resource "cloudflare_ruleset" "transform_monorepo_standards" {
  zone_id     = var.cloudflare_zone_id
  name        = "transform-monorepo-standards"
  description = "Strip /monorepo-standards prefix for Pages proxy"
  kind        = "zone"
  phase       = "http_request_transform"

  rules {
    ref         = "strip_monorepo_standards_prefix"
    description = "Strip /monorepo-standards prefix"
    expression  = "(http.request.uri.path matches \"^/monorepo-standards(/.*)?$\")"
    action      = "rewrite"
    enabled     = true

    action_parameters {
      uri {
        path {
          expression = "regex_replace(http.request.uri.path, \"^/monorepo-standards\", \"\")"
        }
      }
    }
  }
}

resource "cloudflare_ruleset" "origin_monorepo_standards" {
  zone_id     = var.cloudflare_zone_id
  name        = "origin-monorepo-standards"
  description = "Proxy /monorepo-standards to Pages project"
  kind        = "zone"
  phase       = "http_request_origin"

  rules {
    ref         = "proxy_to_pages"
    description = "Rewrite origin to Pages hostname"
    expression  = "(http.request.uri.path matches \"^/monorepo-standards(/.*)?$\")"
    action      = "route"
    enabled     = true

    action_parameters {
      host_header = cloudflare_pages_project.monorepo_standards.subdomain
      origin {
        host = cloudflare_pages_project.monorepo_standards.subdomain
        port = 443
      }
    }
  }
}

resource "cloudflare_ruleset" "redirect_monorepo_standards_root" {
  zone_id     = var.cloudflare_zone_id
  name        = "redirect-monorepo-standards-root"
  description = "Redirect /monorepo-standards to /monorepo-standards/"
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  rules {
    ref         = "trailing_slash_redirect"
    description = "Add trailing slash"
    expression  = "(http.request.uri.path eq \"/monorepo-standards\")"
    action      = "redirect"
    enabled     = true

    action_parameters {
      from_value {
        status_code = 301
        target_url {
          expression = "concat(http.request.uri.path, \"/\")"
        }
        preserve_query_string = true
      }
    }
  }
}
