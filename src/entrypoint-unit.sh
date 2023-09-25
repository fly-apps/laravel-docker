#!/usr/bin/env bash

if [[ $# -gt 0 ]]; then
    exec "$@"
else 
    exec unitd --no-daemon --log /dev/stdout
fi
