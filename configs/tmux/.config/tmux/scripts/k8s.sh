#!/usr/bin/env bash

ctx=$(kubectl config current-context 2>/dev/null) || exit 0
[ -n "$ctx" ] || exit 0
ns=$(kubectl config view --minify -o 'jsonpath={..namespace}' 2>/dev/null)
printf '%s/%s' "$ctx" "${ns:-default}"
