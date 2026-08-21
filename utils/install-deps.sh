#!/usr/bin/env bash

REPO_DIR="$(git rev-parse --show-toplevel)"

function echod() { echo "[DEBUG]: $*"; }

brew_installs=(
    uv
    just
    rg
)

# Skip brew requirement when all the required programs are available otherwise.
for pkg in "${brew_installs[@]}" ; do
    if ! command -v $pkg >/dev/null; then
        echod "Missing package: $pkg"
        needs_brew=1
    fi
done

if [[ $needs_brew -eq 1 ]]; then
    if ! command -v brew >/dev/null; then
        echod "Some required packages are missing, and brew is not available for a userspace-only installation."
        echod "If you are on a non-atomic system, installing them via your system package manager works as well."
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
