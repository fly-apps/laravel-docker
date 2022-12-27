#!/usr/bin/env bash

if [ -z "$DOCKER_HOST" ]; then
    echo "DOCKER_HOST must be set"
    exit 1
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

phpVersions=(
    7.4
    8.0
    8.1
    8.2
)

for phpVersion in ${phpVersions[@]}; do
    docker build \
      --build-arg PHP_VERSION="${phpVersion}" \
      -t "fideloper/fly-laravel:${phpVersion}" \
      -f "${SCRIPT_DIR}/src/Dockerfile" \
      "${SCRIPT_DIR}/src"
done