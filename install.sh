#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Installation directories
INSTALL_DIR="/usr/local/bin"
MAN_DIR="/usr/local/share/man/man1"

# Script name
SCRIPT_NAME="cpdirmk"

# Function to print error messages
error() {
    echo -e "${RED}Error: $1${NC}" >&2
    exit 1
}

# Function to print success messages
success() {
    echo -e "${GREEN}$1${NC}"
}

# Function to print warning messages
warning() {
    echo -e "${YELLOW}Warning: $1${NC}"
}

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
   error "This script must be run as root. Please use sudo or run as root."
fi

# Check if the source files exist
if [[ ! -f "bin/$SCRIPT_NAME" ]]; then
    error "Source script 'bin/$SCRIPT_NAME' not found. Make sure you're in the correct directory."
fi

if [[ ! -f "man/$SCRIPT_NAME.1" ]]; then
    error "Man page 'man/$SCRIPT_NAME.1' not found. Make sure you're in the correct directory."
fi

# Create installation directories if they don't exist
mkdir -p "$INSTALL_DIR" || error "Failed to create installation directory $INSTALL_DIR"
mkdir -p "$MAN_DIR" || error "Failed to create man page directory $MAN_DIR"

# Copy the script to the installation directory
cp "bin/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME" || error "Failed to copy $SCRIPT_NAME to $INSTALL_DIR"

# Make the script executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME" || error "Failed to make $SCRIPT_NAME executable"

# Install the man page
cp "man/$SCRIPT_NAME.1" "$MAN_DIR/$SCRIPT_NAME.1" || error "Failed to copy man page to $MAN_DIR"
gzip -f "$MAN_DIR/$SCRIPT_NAME.1" || warning "Failed to compress man page. It will still be accessible, but not compressed."

# Update man database
if command -v mandb &> /dev/null; then
    mandb &> /dev/null || warning "Failed to update man database. Man page might not be immediately accessible."
else
    warning "mandb command not found. Man page might not be immediately accessible."
fi

# Check if the installation directory is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    warning "$INSTALL_DIR is not in your PATH. You may need to add it to your shell configuration file."
    echo "You can add it by running:"
    echo "echo 'export PATH=\$PATH:$INSTALL_DIR' >> ~/.bashrc"
    echo "Then run: source ~/.bashrc"
fi

success "$SCRIPT_NAME has been successfully installed!"
echo "You can now use the '$SCRIPT_NAME' command from anywhere in the system."
echo "To view usage instructions, type 'man $SCRIPT_NAME'."

# Optional: Offer to add the installation directory to PATH
read -p "Would you like to add $INSTALL_DIR to your PATH now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "export PATH=\$PATH:$INSTALL_DIR" >> ~/.bashrc
    success "Added $INSTALL_DIR to PATH in ~/.bashrc"
    echo "Please run 'source ~/.bashrc' or start a new terminal session for the changes to take effect."
fi

echo "Installation completed."