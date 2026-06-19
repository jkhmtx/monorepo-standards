# shellcheck shell=bash

root="$(git rev-parse --show-toplevel)"

cd "${root}" || exit 1

empty="$(git hash-object -t tree --stdin </dev/null)"
paths=(
	'*.nix'
)

alejandra_flags=()

if test -v CI; then
	alejandra_flags+=(--check)
else
	alejandra_flags+=(--quiet)
fi

{
	git diff --diff-filter=d --name-only -z "${empty}" -- "${paths[@]}" &&
		git ls-files --exclude-standard --others -z -- "${paths[@]}"
} | xargs -0 alejandra "${alejandra_flags[@]}" --
