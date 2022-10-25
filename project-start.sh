#!/bin/bash
set -e

function startProject() {
    docker-compose  -f .devcontainer/docker-compose.yml -f docker-compose.yml up --remove-orphans
}

function stopProject() {
    docker-compose  -f .devcontainer/docker-compose.yml -f docker-compose.yml down
}

startProject
stopProject