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
update_mod "970855993" "Olympus" "MAP_VER"
update_mod "731604991" "Structures Plus" "SP_VER"
update_mod "1650069767" "Sleepable Beds" "SB_VER"
update_mod "895711211" "Classic Flyers" "CF_VER"
update_mod "1300713111" "Rare Sightings" "RS_VER"
update_mod "1251632107" "Immersive Taming" "IT_VER"

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
