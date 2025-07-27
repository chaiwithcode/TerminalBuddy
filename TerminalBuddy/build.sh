#!/usr/bin/env zsh
set -euo pipefail

# 1. Detect project name from Package.swift
PROJECT_NAME=$(grep -E 'name:' Package.swift \
               | head -1 \
               | sed -E 's/.*"([^"]+)".*/\1/')

# 2. Define build and export directories
BUILD_CONFIG="release"
BUILD_DIR=".build/${BUILD_CONFIG}"
EXPORT_DIR="product"

# 3. Clean previous export
rm -rf "${EXPORT_DIR}"
mkdir -p "${EXPORT_DIR}"

# 4. Compile in release mode
echo "🔧 Building ${PROJECT_NAME} (${BUILD_CONFIG})..."
swift build -c ${BUILD_CONFIG}

# 5. Copy the binary to export folder
echo "📦 Exporting binary to ${EXPORT_DIR}/"
cp "${BUILD_DIR}/${PROJECT_NAME}" "${EXPORT_DIR}/"

# 6. Done
echo "✅ ${PROJECT_NAME} built and exported to ${EXPORT_DIR}/${PROJECT_NAME}"
