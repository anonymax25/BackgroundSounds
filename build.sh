#!/bin/bash
set -e

swift build -c release

APP_NAME="BackgroundSound"
BUILD_DIR=".build/release"
EXECUTABLE="$BUILD_DIR/$APP_NAME"
APP_DIR="$BUILD_DIR/$APP_NAME.app"
CONTENTS="$APP_DIR/Contents"
MACOS_DIR="$CONTENTS/MacOS"

# Clean old app bundle
rm -rf "$APP_DIR"

# Create bundle structure
mkdir -p "$MACOS_DIR"

# Copy executable
cp "$EXECUTABLE" "$MACOS_DIR/"

# Create Info.plist
cat > "$CONTENTS/Info.plist" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>$APP_NAME</string>
    <key>CFBundleIdentifier</key>
    <string>com.example.$APP_NAME</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundleExecutable</key>
    <string>$APP_NAME</string>
    <key>LSMinimumSystemVersion</key>
    <string>13.0</string>
    <key>NSPrincipalClass</key>
    <string>NSApplication</string>
</dict>
</plist>
EOF

echo "Built $APP_DIR"
open "$APP_DIR"
