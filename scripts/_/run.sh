# shellcheck shell=bash

export INDEX="${INDEX}"

root="$(git rev-parse --show-toplevel)"
cd "${root}" || exit 1

header='
Down: CTRL-J/Down arrow
Up: CTRL-K/Up arrow
Enter: Run the command
Exit: CTRL-C/Esc

Type to filter

-----------------------
'

fzf \
	--bind='enter:become(_.{1})' \
	--header="${header}" \
	--header-lines=1 \
	--layout=reverse \
	--nth=1 \
	--preview-window=hidden \
	"${@}" \
	<"${INDEX}/index.txt"
