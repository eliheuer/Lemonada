#!/bin/bash
set -e

glyphsSource="Lemonada"
outputDir="fonts/vf"
familyName="Lemonada"

echo "[INFO] Starting build script for $familyName font family"

if [ -d .git ]; then
  echo "[TEST] Running from a Git root directory, looks good"
else
  echo "[WARN] Font family Git root not found, please run from the root directory"
  echo "[WARN] Build process cancelled"
  exit 1
fi

echo "[INFO] Making 'fonts/vf' directory if it doesn't already exist"
mkdir -p -v fonts/vf

# Fontmake
for i in $glyphsSource; do
  echo "[TEST] Queued source file: $i.glyphs"
done

for i in $glyphsSource; do
  echo "[INFO] Building $i.glyphs with Fontmake, this might take some time..."
  fontmake -g sources/$i.glyphs -o variable \
    --output-path $outputDir/$i-VF.ttf \
    --verbose INFO
done

echo "[INFO] Removing build directories"
rm -rf instance_ufo master_ufo

echo "[INFO] Done building $familyName font family"
