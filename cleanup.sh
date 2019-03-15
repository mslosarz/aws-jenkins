#!/bin/sh
docker container stop jenkins_local
docker container rm jenkins_local
docker image rm jenkins_aws
docker volume rm jenkins_home

docker rm $(docker ps -aq)
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker network prune -f
docker rmi -f $(docker images --filter dangling=true -qa)
docker volume rm $(docker volume ls --filter dangling=true -q)
docker rmi -f $(docker images -qa)
docker volume rm $(docker volume ls --filter dangling=true -q)
docker rmi -f $(docker images --filter dangling=true -qa)
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
