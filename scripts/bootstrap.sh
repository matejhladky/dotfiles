#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${REPO_DIR:-$HOME/.dotfiles}"
TARGET="${TARGET:-$HOME}"
PACKAGES="${*:-}"

DEFAULTS=(alacritty)

command -v stow >/dev/null || {
    echo "Error: stow not installed"
    exit 1
}

cd "$REPO_DIR/configs"

if [[ -z "$PACKAGES" ]]; then
    PACKAGES=("${DEFAULTS[@]}")
else
    IFS=' ' read -r -a PACKAGES <<< "$PACKAGES"
fi

for pkg in "${PACKAGES[@]}"; do
    if [[ -d "$pkg" ]]; then
        echo "... stowing $pkg"
	stow -v -R -t "$TARGET" "$pkg"
    else
        echo "! skipping '$pkg' (no such package)"
    fi
done

echo "✓ dotfiles deployed"
