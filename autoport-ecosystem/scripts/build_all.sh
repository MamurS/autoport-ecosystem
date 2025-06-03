#!/bin/bash
set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "🚀 Starting AutoPort build process..."

# Flutter app build
echo "📱 Building Flutter app..."
cd autoport-mobile

# Clean and get dependencies
flutter clean
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Build Android
echo "🤖 Building Android..."
flutter build apk --release
flutter build appbundle --release

# Build iOS (no codesign)
echo "🍎 Building iOS..."
flutter build ios --release --no-codesign

# Build Web
echo "🌐 Building Web..."
flutter build web --release

# Telegram Mini App build
echo "📱 Building Telegram Mini App..."
cd ../autoport-telegram

# Install dependencies if package.json exists
if [ -f "package.json" ]; then
    npm install
    npm run build
fi

echo -e "${GREEN}✅ Build completed successfully!${NC}" 