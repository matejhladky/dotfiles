#!/usr/bin/env bash

dir=${1:-$PWD}
branch=$(git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null) || exit 0
[ -n "$branch" ] || exit 0
printf '#[fg=colour180]%s' "$branch"
