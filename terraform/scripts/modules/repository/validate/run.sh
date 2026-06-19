# shellcheck shell=bash
root="$(git rev-parse --show-toplevel)"
terraform -chdir="${root}/terraform/configs/repository" fmt -check -recursive
terraform -chdir="${root}/terraform/configs/repository" init -backend=false
terraform -chdir="${root}/terraform/configs/repository" validate
