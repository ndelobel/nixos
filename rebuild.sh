#!/run/current-system/sw/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "this script need to be run as admin"
    exit 1
fi

SCRIPT_NAME=$(basename "$0")
CURRENT_DIR=$(dirname "$(readlink -f "$0")")

echo "copying files..."
find "$CURRENT_DIR" -type f -not -name "$SCRIPT_NAME" -exec cp {} /etc/nixos/ \;
find "$CURRENT_DIR" -type d -not -path "$CURRENT_DIR" -exec cp -r {} /etc/nixos/ \;

if [ $? -eq 0 ]; then
    echo "files copy success"
    echo "start system rebuild..."
    nixos-rebuild switch --flake /etc/nixos#laptop
    echo "done"
else
    echo "error copying files"
    exit 1
fi
