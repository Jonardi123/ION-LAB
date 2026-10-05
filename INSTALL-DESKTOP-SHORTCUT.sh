#!/usr/bin/env bash
set -Eeuo pipefail
APP_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
if [ ! -f "$APP_DIR/ion_lab.py" ] || [ ! -f "$APP_DIR/assets/ion-lab.svg" ]; then
  echo 'ION LAB source or icon is missing. Use a complete source bundle before installing the shortcut.' >&2
  exit 1
fi
mkdir -p "$HOME/.local/share/applications" "$HOME/.local/share/icons/hicolor/scalable/apps"
cp "$APP_DIR/assets/ion-lab.svg" "$HOME/.local/share/icons/hicolor/scalable/apps/ion-lab.svg"
cat > "$HOME/.local/share/applications/ion-lab.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=ION LAB
GenericName=AI Research Studio
Comment=Local-first AI training experiments, diagnostics and research reports
Exec=/bin/bash "$APP_DIR/START-ION-LAB.sh"
Icon=ion-lab
Terminal=false
Categories=Development;Science;Education;
StartupNotify=true
EOF
chmod 644 "$HOME/.local/share/applications/ion-lab.desktop"
echo 'ION LAB installed in your desktop app menu. Search for ION LAB.'
