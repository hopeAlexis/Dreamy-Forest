#!/bin/sh
echo -ne '\033c\033]0;Testing\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Testing.x86_64" "$@"
