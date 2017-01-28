#!/bin/bash

# Build images
docker build -t "rajivbhati12/ubuntu_testuser:v1" --build-arg TestUser_Password=test@123 $PWD/docker-first/.
docker build -t "rajivbhati12/ubuntu_mvn:v1" $PWD/docker-mvn/.
docker build -t "rajivbhati12/ubuntu_java:v1" $PWD/docker-java/.
docker build -t "rajivbhati12/ubuntu_junit:v1" $PWD/docker-junit/.

docker build -t "rajivbhati12/ubuntu_nodejs:v1" $PWD/docker-nodejs/.

docker build -t "rajivbhati12/ubuntu_selenium_base:v1" $PWD/docker-selenium-base/.
docker build -t "rajivbhati12/ubuntu_selenium_grid:v1" $PWD/docker-selenium-grid/.

# node-base is provide base image for building browser specific node images on top of it  
docker build -t "rajivbhati12/ubuntu_selenium_node_base:v1"  $PWD/docker-selenium-node-base/.
docker build -t "rajivbhati12/ubuntu_selenium_node_chrome:v1" $PWD/docker-selenium-node-chrome/.


# Build containers
docker run -d --name testuser rajivbhati12/ubuntu_testuser:v1
docker run -d --name mvn rajivbhati12/ubuntu_mvn:v1
docker run -d --name java rajivbhati12/ubuntu_java:v1
docker run -d --name junit --volumes-from java rajivbhati12/ubuntu_junit:v1
docker run -d --name nodejs rajivbhati12/ubuntu_nodejs:v1


docker run -d --name selenium-base rajivbhati12/ubuntu_selenium_base:v1
docker run -d --name selenium-grid --volumes-from java --volumes-from selenium-base -P rajivbhati12/ubuntu_selenium_grid:v1

docker run -d --name selenium-node-chrome --volumes-from java --volumes-from selenium-base --link selenium-grid:hub rajivbhati12/ubuntu_selenium_node_chrome:v1
