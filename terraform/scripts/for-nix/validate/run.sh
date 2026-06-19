# shellcheck shell=bash
root="$(git rev-parse --show-toplevel)"
cd "${root}/terraform"
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
