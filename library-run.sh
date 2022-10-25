#!/bin/bash
set -e
source "$(dirname "$(readlink -f "$0")")/project-library-commons.sh"

function startProject() {
	local environment=$1

	printHeader "Start Environment: $environment"

	export DOCKER_BUILDKIT=1
	if [[ $environment == "development" ]]; then
		composeFile="docker-compose-development.yml"
	elif [[ "$environment" == "production" ]]; then
		composeFile="docker-compose-production.yml"
	else
		printError "The project could not been started, because the passed environment type '$environment' is invalid."
		return 1
	fi

	databasePassword=$(cat ./Database/database.password)
	docker-compose \
		-f docker-compose.yml \
		-f $composeFile

	# The production environment must be started in attached mode. This is because the production server
	# is configured to use systemd to start this script as a service. When the server are rebooted or the service
	# crashes, then systemd restarts the service automatically. Therefore if the project is not started in attached mode,
	# this script is terminated right after starting the project. Systemd will think that the service crashed and will restart
	# it. This causes an infinite loop of service restarts.
	docker-compose \
		-f docker-compose.yml \
		-f $composeFile \
		up --remove-orphans
}

function stopProject() {
	local environment=$1

	printHeader "Stop Environment: $environment"
	if [[ $environment == "development" ]]; then
		composeFile="docker-compose-development.yml"
	elif [[ "$environment" == "production" ]]; then
		composeFile="docker-compose-production.yml"
	else
		printError "The project could not been stopped, because the passed environment type '$environment' is invalid."
		return 1
	fi

	docker-compose -f docker-compose.yml -f $composeFile down
}