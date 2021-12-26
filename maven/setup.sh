#!/bin/bash

docker build -f Dockerfile-maven --build-arg MAVEN_VERSION=3.8.4 --tag maven:3.8.4 .

mkdir -p ~/.m2
