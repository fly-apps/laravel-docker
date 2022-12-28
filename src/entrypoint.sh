#!/usr/bin/env bash

if [[ $# -gt 0 ]]; then
    exec "$@"
else
    exec supervisord -c /etc/supervisor/supervisord.conf
fi
