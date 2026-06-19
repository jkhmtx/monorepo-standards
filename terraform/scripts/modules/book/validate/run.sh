# shellcheck shell=bash
root="$(git rev-parse --show-toplevel)"
terraform -chdir="${root}/terraform/configs/book" fmt -check -recursive
terraform -chdir="${root}/terraform/configs/book" init -backend=false
terraform -chdir="${root}/terraform/configs/book" validate
