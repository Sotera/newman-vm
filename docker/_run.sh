#!/bin/bash
docker run --privileged -dt --name docker -h docker -p 8082:8082 jreeme/docker-within-docker:17-MAY-2017
