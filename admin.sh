#!/bin/bash

if [ -z "$SUDO_USER" ]; then
    echo "This script must be run with sudo."
    exit 1
fi

echo "Setting up Neovim configuration for root and user $SUDO_USER..."

REPO_DIR=$(dirname $(readlink -f $0))
USER_TARGET_DIR=~${SUDO_USER}/.config/nvim
ROOT_TARGET_DIR=/root/.config/nvim

mkdir -p $ROOT_TARGET_DIR
rsync -a --exclude='.git' --exclude='admin.sh' --exclude='user.sh' $REPO_DIR/ $ROOT_TARGET_DIR/

mkdir -p $USER_TARGET_DIR
rsync -a --exclude='.git' --exclude='admin.sh' --exclude='user.sh' $REPO_DIR/ $USER_TARGET_DIR/
chown -R $SUDO_USER:$SUDO_USER $USER_TARGET_DIR

echo "Neovim configuration has been set up in $ROOT_TARGET_DIR for root and in $USER_TARGET_DIR for user $SUDO_USER"
