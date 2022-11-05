#!/bin/sh
set -eu

export $(cat src/defines.env | xargs)

echo "Manifest-Version: 1.0" > build/META-INF/MANIFEST.MF
rm -f build/com.francma.intellij.everforest-${VERSION}.jar
cd build && zip -r com.francma.intellij.everforest-${VERSION}.jar *
