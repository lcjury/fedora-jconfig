#!/bin/bash
# Copies active KDE Jury theme files from the system into this repo

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
KDE_THEMES_DIR="$REPO_DIR/kde-themes"

mkdir -p "$KDE_THEMES_DIR/color-schemes"
mkdir -p "$KDE_THEMES_DIR/aurorae"
mkdir -p "$KDE_THEMES_DIR/look-and-feel"

echo "Exporting Jury color scheme..."
cp ~/.local/share/color-schemes/Jury.colors "$KDE_THEMES_DIR/color-schemes/"

echo "Exporting Jury aurorae window decoration..."
cp -r ~/.local/share/aurorae/themes/Jury "$KDE_THEMES_DIR/aurorae/"

echo "Exporting Jury look-and-feel package..."
cp -r ~/.local/share/plasma/look-and-feel/Jury "$KDE_THEMES_DIR/look-and-feel/"

echo "Done. Files saved to $KDE_THEMES_DIR"
