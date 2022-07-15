#!/bin/bash

docker_compose_command="docker compose"

$docker_compose_command down
$docker_compose_command rm -f
echo "y" | docker volume prune -f
$docker_compose_command up -d