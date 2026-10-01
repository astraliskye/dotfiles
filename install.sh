#!/bin/bash

set -euo pipefail

project_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

umask 077

mkdir -p ~/.config
mkdir -p "$project_root/backups"
backup_dir=$(mktemp -d -p "$project_root/backups" "install-XXXXXX")

declare -A targets

targets=(
	[nvim]=~/.config/nvim
	[tmux]=~/.config/tmux
	[alacritty]=~/.config/alacritty
	[".gitconfig"]=~/.gitconfig
)

backup_created=false

for key in "${!targets[@]}"; do
	if [[ -L "${targets[$key]}" && "$(readlink "${targets[$key]}")" == "$project_root/$key" ]]; then
		continue
	fi

	if [[ -e "${targets[$key]}" || -L "${targets[$key]}" ]]; then
		mv "${targets[$key]}" "$backup_dir"
		backup_created=true
	fi

	ln -s "$project_root/$key" "${targets[$key]}"
done

if [[ "$backup_created" == false ]]; then
	rmdir "$backup_dir"
fi
