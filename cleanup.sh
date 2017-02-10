#!/bin/bash

echo "Removing stopped containers:"
docker rm $(docker ps --filter status=exited -q)

echo "Removing unused images"
docker rmi $(docker images -q)

echo "Removing dangling volumes"
docker volume rm $(docker volume ls -f dangling=true -q)
