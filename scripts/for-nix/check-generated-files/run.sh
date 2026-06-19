# shellcheck shell=bash

root="$(git rev-parse --show-toplevel)"
cd "${root}"

tmp="$(mktemp)"
cp index.nix "${tmp}"

infallible.update-nix-index

if ! diff -q "${tmp}" index.nix >/dev/null 2>&1; then
	echo "ERROR: index.nix is out of date. Run: nix run --file . infallible.update-nix-index"
	diff "${tmp}" index.nix || true
	mv "${tmp}" index.nix
	exit 1
fi

rm -f "${tmp}"
echo "index.nix is up to date"
