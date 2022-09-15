#!/bin/bash

docker compose up --build --force-recreate -d && docker compose logs -f