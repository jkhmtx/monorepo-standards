# shellcheck shell=bash

root="$(git rev-parse --show-toplevel)"

cd "${root}" || exit 1

empty="$(git hash-object -t tree --stdin </dev/null)"
nix_paths=(':(glob)**/main.nix')
paths_lst="$(mktemp)"
{
	git diff --diff-filter=d --name-only "${empty}" -- "${nix_paths[@]}" &&
		git ls-files --exclude-standard --others -- "${nix_paths[@]}"
} >"${paths_lst}"
mapfile -t paths <"${paths_lst}"
rm "${paths_lst}"

tuples_lst="$(mktemp)"
for path in "${paths[@]}"; do
	name="/${path}"
	name="${name%/main.nix}"
	name="${name//\//.}"
	name="${name/.scripts/}"

	case "${name}" in
	.apps.*) name="${name#.apps.}" ;;
	.terraform.*) name="${name#.}" ;;
	.root.*) name="${name#.}" ;;
	.*) name="all${name}" ;;
	esac

	echo "${name} ${path}"
done | sort >"${tuples_lst}"
mapfile -t tuples <"${tuples_lst}"
rm "${tuples_lst}"

next="$(mktemp)"

{
	echo '# Do not edit directly. This file is generated with:'
	echo '#   nix --print-build-logs run --file . infallible.update-nix-index'
	echo '{'
	echo '  load,'
	echo '  nixpkgs,'
	echo '  ...'
	echo '}: let'
	echo '  inherit (nixpkgs.lib.attrsets) recursiveUpdate;'
	echo '  inherit (nixpkgs.lib.lists) fold;'
	echo
	echo '  merge = fold recursiveUpdate {};'
	echo 'in'
	echo '  merge ['
	for tuple in "${tuples[@]}"; do
		read -r name path <<<"${tuple}"
		echo "    {${name} = load ./${path};}"
	done
	echo '  ]'
} >"${next}"

if diff index.nix "${next}" >/dev/null 2>&1; then
	rm "${next}"
else
	mv "${next}" index.nix
fi
