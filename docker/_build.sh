#!/bin/bash
docker stop docker
docker rm docker
docker build --rm -t jreeme/docker-within-docker:17-MAY-2017 .

