#!/usr/bin/env bash


# Abort on any error
set -e -u

# Simpler git usage, relative file paths
CWD=$(dirname "$0")
cd "$CWD"

# Load helpful functions
source libs/common.sh
source libs/docker.sh

# Check dependencies
assert_dependency "jq"
assert_dependency "curl"

# Debian Stable with ARK
update_image "hetsh/ark" "ARK" "true" "\d+-\d+"

# Mods
update_mod "731604991" "Structures Plus" "SP_VER"
update_mod "558651608" "Bridges" "BRIDGE_VER"
update_mod "1814953878" "Castles, Keeps and Forts: Remastered" "CKFR_VER"
update_mod "2121156303" "Castles, Keeps and Forts: Science Fiction" "CKFSF_VER"
update_mod "793605978" "Super Spyglass" "SSG_VER"
update_mod "670764308" "eco's Trees" "ET_VER"
update_mod "880871931" "eco's Garden Decor" "EGD_VER"
update_mod "741203089" "eco's Role Play Decor" "ERPD_VER"

if ! updates_available; then
	#echo "No updates available."
	exit 0
fi

# Perform modifications
if [ "${1-}" = "--noconfirm" ] || confirm_action "Save changes?"; then
	save_changes

	if [ "${1-}" = "--noconfirm" ] || confirm_action "Commit changes?"; then
		commit_changes
	fi
fi