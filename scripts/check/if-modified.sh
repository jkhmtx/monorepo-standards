# shellcheck shell=bash

export COMMAND="${COMMAND}"
export PATHS="${PATHS}"

base_ref="${GITHUB_BASE_REF:-main}"

function was_modified() {
	set +o errexit
	git diff --exit-code --quiet --merge-base "origin/${base_ref}" -- "${PATHS}"
	exit_code="${?}"
	set -o errexit

	case "${exit_code}" in
	0) return 1 ;;
	1) return 0 ;;
	*) exit "${exit_code}" ;;
	esac
}

function is_untracked() {
	set +o errexit
	lines="$(git ls-files --exclude-standard --others -- "${PATHS}" | wc -l)"
	exit_code="${?}"
	set -o errexit

	case "${exit_code}" in
	0) test "${lines}" -gt 0 ;;
	*) exit "${exit_code}" ;;
	esac
}

if was_modified || is_untracked; then
	"${COMMAND}" "${@}"
fi
