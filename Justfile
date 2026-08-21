export PATH := justfile_directory() + "/utils:" + env("PATH")
export GITHUB_REPOSITORY := "ublue-os/bazzite"
export MKDOCS_REPO_URL := "https://github.com/" + GITHUB_REPOSITORY
MKDOCS_DIR := justfile_directory()

_default:
    just --list

# Install dependencies required for documentation stuff
install_dependencies:
    bash ./utils/install-deps.sh

# Workaround for the cairo error in macOS when only a Homebrew installed cairo is available.
# Should no-op for non-macOS environments, and shouldn't hurt if cairo is available otherwise.
# Both Intel and Apple Silicon default paths for Homebrew are covered.
# Due to macOS limitations, this variable MUST be explicitly passed to the direct invocation,
# thus rendering the env approach impossible.
# Sources:
# - https://t.ly/MfX6u (modified to add Intel search path)
# - https://apple.stackexchange.com/questions/212945/unable-to-set-dyld-fallback-library-path-in-shell-on-osx-10-11-1
# [env("DYLD_FALLBACK_LIBRARY_PATH", "/opt/homebrew/lib:/usr/local/homebrew/lib")]
mkdocs +ARGS="":
    rm -rf {{ MKDOCS_DIR }}/.cache/cmdrun
    DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib:/usr/local/homebrew/lib uv run mkdocs {{ ARGS }}

mkdocs_clean:
    rm -rf {{ MKDOCS_DIR }}/.cache

# Format all markdown files with prettier
fmt:
    prettier --check --write $(find src -type f -name '*.md')

# Fix headers
_fmt-headers:
    rg '^#\s' src/ --json \
    | jq -rs '.[] | select(.type=="end") | {file: .data.path.text, number: .data.stats.matches} | select(.number > 1) | .file' \
    | xargs -I{} sed -i -E 's/(^#+) /\1# /' {}
