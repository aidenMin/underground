#! /bin/bash

docker-compose up

docker-compose rm -f
docker rm -f $(docker-compose ps -1)