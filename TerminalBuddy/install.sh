#!/usr/bin/env zsh
set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Project configuration
BUILD_CONFIG="release"
BUILD_DIR=".build/${BUILD_CONFIG}"
EXPORT_DIR="product"
INSTALL_DIR="$HOME/.local/bin"

# 1. Detect project name from Package.swift
PROJECT_NAME=$(grep -E '^\s*name\s*:' Package.swift \
  | head -1 \
  | sed -E 's/.*"([^"]+)".*/\1/' \
  | tr -d '[:space:]')

if [[ -z "$PROJECT_NAME" ]]; then
  echo -e "${RED}❌ Could not detect project name from Package.swift${NC}"
  exit 1
fi

# 2. Define binary paths
BINARY_PATH="${EXPORT_DIR}/${PROJECT_NAME}"
TARGET_PATH="${INSTALL_DIR}/${PROJECT_NAME}"

# 3. Installation
echo -e "${GREEN}📦 Installing 🤖 ${PROJECT_NAME}...${NC}"

# Create install directory
if [[ ! -d "$INSTALL_DIR" ]]; then
  echo -e "${YELLOW}📁 Creating directory $INSTALL_DIR${NC}"
  mkdir -p "$INSTALL_DIR"
fi

# Check if binary exists
if [[ ! -f "$BINARY_PATH" ]]; then
  echo -e "${RED}❌ Error: Binary not found at $BINARY_PATH${NC}"
  echo "Please run ./build.sh first to build the project."
  exit 1
fi

# Copy binary and make executable
echo "📥 Installing binary: $BINARY_PATH → $INSTALL_DIR"
cp "$BINARY_PATH" "$TARGET_PATH"
chmod +x "$TARGET_PATH"

echo -e "${GREEN}✅ Successfully installed ${PROJECT_NAME} to $INSTALL_DIR${NC}"

# === Zsh PATH Setup ===
ZSHRC_PATH="$HOME/.zshrc"
PATH_EXPORT_LINE="export PATH=\"\$HOME/.local/bin:\$PATH\""

if grep -qF "$PATH_EXPORT_LINE" "$ZSHRC_PATH" 2>/dev/null; then
  echo "💡 PATH already includes ~/.local/bin"
else
  echo -e "${GREEN}📝 Adding ~/.local/bin to your PATH in ~/.zshrc...${NC}"
  echo "" >> "$ZSHRC_PATH"
  echo "$PATH_EXPORT_LINE" >> "$ZSHRC_PATH"
  source ~/.zshrc
  echo -e "${GREEN}✅ PATH updated!${NC}"
fi

# Final message
echo
echo -e "${GREEN}🎉 You're all set!${NC}"
echo "To start using '${PROJECT_NAME}' right away, run:"
echo -e "   ${YELLOW}source ~/.zshrc${NC}"
echo "Then try:"
echo -e "   terminalbuddy Tell me a joke about Apple${NC}"
echo
echo "💡 You can now use terminalbuddy from anywhere in your terminal."
