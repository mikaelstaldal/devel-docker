#!/bin/bash

docker build --build-arg JAVA_VERSION=11 --build-arg MAVEN_VERSION=3.8.4 --tag maven:3.8.4-Java11 .

mkdir -p ~/.m2
