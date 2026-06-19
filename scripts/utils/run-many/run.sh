# shellcheck shell=bash

export MAKEFILE="${MAKEFILE}"
export PARALLEL="${PARALLEL}"

function is_top_level() {
	! test -v MAKEFLAGS
}

make=(
	make
	--always-make
	--file="${MAKEFILE}"
	--no-builtin-variables
	--no-builtin-rules
	--no-keep-going
	--no-print-directory
	--shuffle=none
	"${@}"
)

case "${PARALLEL}" in
auto)
	# Skip setting --jobs if we're already in a make job.
	# Make will automatically share the jobs server pool with the parent.
	if is_top_level; then
		make+=(--jobs "$(nproc)")
	fi
	;;
*) make+=(--jobs "${PARALLEL}") ;;
esac

export EXIT_CODES
if is_top_level; then
	EXIT_CODES="$(mktemp)"
fi

set +e
"${make[@]}"
make_exit_code="${?}"
set -e

if is_top_level; then
	failed=()
	while read -r exit_code command; do
		if test "${exit_code}" -ne 0; then
			failed+=("${command}")
		fi
	done <"${EXIT_CODES}"

	if test "${#failed[@]}" -gt 0; then
		echo
		echo "The following commands failed. Check out the logs above for more information:"
		for command in "${failed[@]}"; do
			echo "  ${command}"
		done
	fi
fi

if test "${make_exit_code}" -ne 0; then
	exit "${make_exit_code}"
fi
