variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "GitHub user or org owning the repo"
  type        = string
  default     = "jakehamilton"
}

variable "github_repo" {
  description = "Repository name"
  type        = string
  default     = "monorepo-standards"
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
  default     = "ff21035dd9c619ac289eb0765077a53b"
}
