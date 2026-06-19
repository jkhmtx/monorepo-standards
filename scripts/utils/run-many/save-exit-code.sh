# shellcheck shell=bash

export EXIT_CODES

name="${1}"
shift

set +e
"${@}"
exit_code="${?}"
set -e

echo "${exit_code} ${name}" >>"${EXIT_CODES}"

exit "${exit_code}"
