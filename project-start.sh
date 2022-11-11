#!/bin/bash
set -e

mkdir -p enterprise

function startProject() {
    # docker-compose -f docker-compose.yml -f .devcontainer/docker-compose.yml up --remove-orphans
    docker-compose -f docker-compose.yml up --remove-orphans

    # --remove-orphans: Remove containers for services not defined in the Compose file.
}

function stopProject() {
    # docker-compose -f docker-compose.yml -f .devcontainer/docker-compose.yml down
    docker-compose -f docker-compose.yml down
}

startProject
stopProject