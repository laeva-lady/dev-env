#!/usr/bin/env bash

echo "Using '$WORKSTATION' as the install directory;"
echo "change the WORKSTATION environment variable to change install directory."

read -p "Continue? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Continuing..."
else
    echo "Aborting installation."
    exit 1
fi
# dev-env installer script
# This script clones the dev-env repository and installs the dotfiles.

set -e
set -o pipefail

# --- Configuration ---
# The GitHub repository to clone.
# IMPORTANT: Replace with your actual repository URL.
REPO_URL="https://github.com/laeva-lady/dev-env.git"

# The local directory to clone into.
if [ -z "$WORKSTATION" ]; then
    WORKSTATION="$HOME/personal/dev-env"
fi
DEST_DIR="$WORKSTATION"

# --- Helper Functions ---
msg() {
    echo -e "[INSTALL] :: $1"
}

# --- Main Installation Logic ---
run_install() {
    local repo_dir=$1
    msg "Starting installation from repository at $repo_dir"

    # Change to the repo directory to make things easier
    mkdir -p "$repo_dir"
    cd "$repo_dir"

    # --- Installation of environment files ---
    msg "Installing environment files..."

    # Copying config directories from env/.config to ~/.config
    local config_source_dir="env/.config"
    local config_dest_dir="$HOME/.config"

    if [ -d "$config_source_dir" ]; then
        msg "Copying configurations to $config_dest_dir"
        mkdir -p "$config_dest_dir"
        for item in "$config_source_dir"/*; do
            if [ -d "$item" ]; then
                msg "	Copying directory $(basename "$item")"
                cp -r "$item" "$config_dest_dir/"
            fi
        done
    else
        msg "Warning: $config_source_dir not found. Skipping."
    fi

    # Copying files from env/ to ~/
    local env_source_dir="env"
    local env_dest_dir="$HOME"

    if [ -d "$env_source_dir" ]; then
        msg "Copying files to $env_dest_dir"
        for item in "$env_source_dir"/*; do
            if [ -f "$item" ]; then
                msg "	Copying file $(basename "$item")"
                cp "$item" "$env_dest_dir/"
            fi
        done
    else
        msg "Warning: $env_source_dir not found. Skipping."
    fi

    # --- Installation of binary scripts ---
    msg "Installing binary scripts..."

    local bin_source_dir="bin"
    local bin_dest_dir="$HOME/.local/bin"

    if [ -d "$bin_source_dir" ]; then
        msg "Copying scripts to $bin_dest_dir"
        mkdir -p "$bin_dest_dir"
        for item in "$bin_source_dir"/*; do
            if [ -f "$item" ]; then
                msg "	Copying script $(basename "$item")"
                cp "$item" "$bin_dest_dir/"
                chmod +x "$bin_dest_dir/$(basename "$item")"
            fi
        done
    else
        msg "Warning: $bin_source_dir not found. Skipping."
    fi

    msg "Installation complete!"
    msg "Please note: system-wide files (like those in resources/) have not been installed, manual steps is required"
    msg "You may need to restart your shell for changes to take effect."
}


# --- Script Entry Point ---

# Check if we are inside the destination directory already
if [ "$(pwd)" == "$DEST_DIR" ] && [ -d ".git" ]; then
    msg "Running from inside the destination directory."
    run_install "$DEST_DIR"
    exit 0
fi

# If not in the repo, we assume we need to clone.
msg "dev-env repository not found locally or not in the correct directory."

if ! command -v git &> /dev/null; then
    msg "Error: git is not installed. Please install git and try again."
    exit 1
fi

if [ -d "$DEST_DIR" ]; then
    msg "Directory $DEST_DIR already exists."
    read -p "Update existing repository? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cd "$DEST_DIR"
        msg "Pulling latest changes from origin..."
        git pull
        run_install "$DEST_DIR"
    else
        msg "Aborting installation."
        exit 1
    fi
else
    msg "Cloning $REPO_URL into $DEST_DIR..."
    git clone "$REPO_URL" "$DEST_DIR"
    run_install "$DEST_DIR"
fi

exit 0
