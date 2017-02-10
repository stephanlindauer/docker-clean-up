#!/bin/bash

echo "Starting at $(date)"

# Containers
echo "Containers before:"
docker ps -a
echo "Removing stopped containers:"
docker rm $(docker ps --filter status=exited -q)
echo "Containers after:"
docker ps -a

# Images
echo "Images before:"
docker images -a
echo "Removing unused images"
docker rmi $(docker images -q)
echo "Images after:"
docker images -a

# Volumes
echo "Volumes before:"
docker images -a
echo "Removing dangling volumes"
docker volume rm $(docker volume ls -f dangling=true -q)
echo "Volumes after:"
docker images -a
