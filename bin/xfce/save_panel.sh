#!/bin/bash
###############################################################################
#
#  Save your (user's) XFCE Panel configuration.
#
###############################################################################
set -x
DEST="${1}"
if [[ -z "${DEST}" ]]; then
    echo "Usage: ${0} dest"
    echo
    echo "Arguments: dest   Destination location to save to"
    exit 1
fi
if [[ -d "${DEST}" ]]; then
    echo "Destination directory already exists, bailing"
    exit 1
fi
function save {
    mkdir -p "${DEST}/"$(dirname "${1}")
    cp -r "${HOME}/${1}" "${DEST}"
}

save ".config/xfce4/panel"
save ".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"
