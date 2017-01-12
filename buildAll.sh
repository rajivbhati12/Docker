#!/bin/bash

# Build images
docker build -t "rajivbhati12/ubuntu_testuser:latest" --build-arg TestUser_Password=test@123 $PWD/docker-first/.
docker build -t "rajivbhati12/ubuntu_java:latest" $PWD/docker-java/.
docker build -t "rajivbhati12/ubuntu_junit:latest" $PWD/docker-junit/.

docker build -t "rajivbhati12/ubuntu_selenium_base:latest" $PWD/docker-selenium-base/.
docker build -t "rajivbhati12/ubuntu_selenium_grid:latest" $PWD/docker-selenium-grid/.

# node-base is provide base image for building browser specific node images on top of it  
docker build -t "rajivbhati12/ubuntu_selenium_node_base:latest"  $PWD/docker-selenium-node-base/.
docker build -t "rajivbhati12/ubuntu_selenium_node_chrome:latest" $PWD/docker-selenium-node-chrome/.


# Build containers
docker run -d --name testuser rajivbhati12/ubuntu_testuser:latest
docker run -d --name java rajivbhati12/ubuntu_java:latest
docker run -d --name junit --volumes-from java rajivbhati12/ubuntu_junit:latest

docker run -d --name selenium-base rajivbhati12/ubuntu_selenium_base:latest
docker run -d --name selenium-grid --volumes-from java --volumes-from selenium-base -P rajivbhati12/ubuntu_selenium_grid:latest

docker run -d --name selenium-node-chrome --volumes-from java --volumes-from selenium-base --link selenium-grid:hub rajivbhati12/ubuntu_selenium_node_chrome:latest
