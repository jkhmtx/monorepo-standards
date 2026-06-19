data "github_repository" "this" {
  name = var.github_repo
}

resource "github_branch_protection" "main" {
  repository_id = data.github_repository.this.node_id
  pattern       = "main"

  required_status_checks {
    strict = true
    contexts = [
      "Global / Format Nix",
      "Global / Format Shell",
      "Global / Lint YAML",
      "Global / Lint GitHub Actions",
      "Global / Lint Markdown",
      "Global / Check Generated Files",
    ]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = false
    required_approving_review_count = 0
  }

  enforce_admins      = false
  allows_force_pushes = false
  allows_deletions    = false
}

resource "github_actions_secret" "cf_api_token" {
  repository      = var.github_repo
  secret_name     = "CF_API_TOKEN"
  plaintext_value = var.cloudflare_api_token
}

resource "github_actions_secret" "cf_account_id" {
  repository      = var.github_repo
  secret_name     = "CF_ACCOUNT_ID"
  plaintext_value = var.cloudflare_account_id
}
