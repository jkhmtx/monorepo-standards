# shellcheck shell=bash

root="$(git rev-parse --show-toplevel)"
cd "${root}"
mapfile -t files < <(git ls-files -- '*.md')
if [[ ${#files[@]} -gt 0 ]]; then
	markdownlint-cli2 "${files[@]}"
fi
