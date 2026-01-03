#!/bin/bash
set -euo pipefail

cd /root/IOT

ts="$(date -Is)"

if [ ! -e /dev/ttyUSB0 ]; then
  echo "$ts,ERR_NO_DEVICE" >> /root/IOT/docs/meresek.csv
  exit 0
fi

line="$(timeout 12s stdbuf -oL cat /dev/ttyUSB0 | tr -d '\r' | grep -m 1 '^T=' || true)"

if [ -z "$line" ]; then
  echo "$ts,ERR_NO_DATA" >> /root/IOT/docs/meresek.csv
  exit 0
fi

echo "$ts,$line" >> /root/IOT/docs/meresek.csv

