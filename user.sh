
#!/bin/bash

echo "Setting up Neovim configuration for the current user..."

REPO_DIR=$(dirname $(readlink -f $0))
TARGET_DIR=~/.config/nvim

mkdir -p $TARGET_DIR

rsync -a --exclude='admin.sh' --exclude='user.sh' $REPO_DIR/ $TARGET_DIR/

echo "Neovim configuration has been set up in $TARGET_DIR"
