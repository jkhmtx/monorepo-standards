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

variable "cloudflare_zone_id" {
  description = "jkhmtx.com zone ID"
  type        = string
  default     = "f6cf8939126c27b0edf570613b56096a"
}
