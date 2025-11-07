#!/bin/bash
# Setup and validation script for BackingSnap Flutter app

set -e

echo "🚀 BackingSnap Setup Script"
echo "============================"
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    echo "Visit: https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter is installed"
flutter --version
echo ""

# Get dependencies
echo "📦 Installing dependencies..."
flutter pub get
echo ""

# Generate code
echo "🔧 Generating code for models..."
flutter pub run build_runner build
echo ""

# Run analyzer
echo "🔍 Running analyzer..."
flutter analyze
echo ""

# Run tests
echo "🧪 Running unit tests..."
flutter test
echo ""

# Run integration tests (optional, may require device/emulator)
echo "🎯 Integration tests can be run with:"
echo "   flutter test integration_test/"
echo ""

echo "✨ Setup complete!"
echo ""
echo "To run the app:"
echo "  flutter run"
echo ""
echo "For more information, see README.md and DEVELOPMENT.md"
