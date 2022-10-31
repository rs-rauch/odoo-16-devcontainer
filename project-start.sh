#!/bin/bash
set -e

function startProject() {
    # docker-compose -f docker-compose.yml -f .devcontainer/docker-compose.yml up --remove-orphans
    docker-compose -f docker-compose.yml up --remove-orphans
}

function stopProject() {
    # docker-compose -f docker-compose.yml -f .devcontainer/docker-compose.yml down
    docker-compose -f docker-compose.yml down
}

startProject
stopProject