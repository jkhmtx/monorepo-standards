# shellcheck shell=bash

root="$(git rev-parse --show-toplevel)"

cd "${root}" || exit 1

empty="$(git hash-object -t tree --stdin </dev/null)"
paths=(
	'*.sh'
	.envrc
)

if test -v CI; then
	flags=(--diff)
else
	flags=(--list --write)
fi

{
	git diff --diff-filter=d --name-only -z "${empty}" -- "${paths[@]}" &&
		git ls-files --exclude-standard --others -z -- "${paths[@]}"
} | xargs --no-run-if-empty --null shfmt "${flags[@]}"
