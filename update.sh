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
update_image "hetsh/ark" "ARK" "true" "(\d+\.)+\d+-\d+"

# Structures Plus
UPDATE_ID="SP_UPDATE"
UPDATE_REGEX="\d+ [a-zA-Z]+ @ \d+:\d+(am|pm)"
CURRENT_SP_VERSION=$(cat Dockerfile | grep -P -o "(?<=$UPDATE_ID=)\"$UPDATE_REGEX\"")
NEW_SP_VERSION=$(curl --silent --location "https://steamcommunity.com/sharedfiles/filedetails/changelog/731604991" | grep -P -o "(?<=Update: )$UPDATE_REGEX" | head -n 1)
if [ "$CURRENT_SP_VERSION" != "$NEW_SP_VERSION" ]; then
	prepare_update "$UPDATE_ID" "Structures Plus" "$CURRENT_SP_VERSION" "$NEW_SP_VERSION"
	update_release "$NEW_SP_VERSION"
fi

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