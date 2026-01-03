#!/bin/bash
set -euo pipefail

cd /root/IOT

git add docs/meresek.csv
git commit -m "Daily measurements $(date -I)" || exit 0
git push

