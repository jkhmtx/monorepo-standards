# shellcheck shell=bash

grey=
reset=
if { tput setaf 8 && tput sgr0; } >/dev/null 2>&1; then
	grey="$(tput setaf 8)"
	reset="$(tput sgr0)"
fi

"${@}" \
	1> >(awk -v prefix="${grey}${1}${reset}|" '{print prefix $0}') \
	2> >(awk -v prefix="${grey}${1}${reset}:stderr|" '{print prefix $0}' 1>&2)
