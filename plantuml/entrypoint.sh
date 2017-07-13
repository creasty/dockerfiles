#!/usr/bin/env bash

set -eu
set -o pipefail

FILE="${@:(-1)}"
DIR="$(dirname "$FILE")"

cd /workdir
mkdir -p "/tmp/$DIR"
cp "$FILE" "/tmp/$DIR"
cd /tmp

java -Djava.awt.headless=true -jar /usr/share/plantuml.jar "$@"

for f in `find "/tmp/$DIR" -type f -maxdepth 1 -not -name '*.uml'`; do
  cp "$f" "/workdir/$DIR"
done
