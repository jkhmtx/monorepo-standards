# shellcheck shell=bash
root="$(git rev-parse --show-toplevel)"
cd "${root}"
biome lint .
