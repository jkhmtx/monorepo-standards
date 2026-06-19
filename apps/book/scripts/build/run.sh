# shellcheck shell=bash
root="$(git rev-parse --show-toplevel)"
cd "${root}/apps/book"
mdbook build
