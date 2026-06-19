# shellcheck shell=bash

root="$(git rev-parse --show-toplevel)"
cd "${root}"
mapfile -t files < <(git ls-files -- '*.yml' '*.yaml')
if [[ ${#files[@]} -gt 0 ]]; then
	yamllint "${files[@]}"
fi
