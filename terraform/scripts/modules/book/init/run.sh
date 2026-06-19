# shellcheck shell=bash
root="$(git rev-parse --show-toplevel)"
terraform -chdir="${root}/terraform/configs/book" init
