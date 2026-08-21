#!/usr/bin/env bash

REPO_DIR="$(git rev-parse --show-toplevel)"

function echod() { echo "[DEBUG]: $*"; }

brew_installs=(
    uv
    just
    rg
)

# Skip brew requirement when all the required programs are available otherwise.
for i in $brew_installs ; do
    if ! command -v $i >/dev/null; then
        needs_brew=1
    fi
done

if [[ -n "$needs_brew" ]]; then
    if ! command -v brew >/dev/null; then
        echod "This script needs 'brew' to run"
        exit 1
    else
        brew install "${brew_installs[@]}"
    fi
fi

# Install project
echod "Setting up python project"
(
    cd "$REPO_DIR"
    uv venv
) || {
    echod "Error setting up python project"
    exit 1
}
echod "Dependencies installed succesfully"
