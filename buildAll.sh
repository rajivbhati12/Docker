#!/bin/bash

# Build images
docker build -t "rajivbhati12/ubuntu_testuser:v1" --build-arg TestUser_Password=test@123 $PWD/docker-first/.
docker build -t "rajivbhati12/ubuntu_java:v1" $PWD/docker-java/.

docker build -t "rajivbhati12/ubuntu_selenium_base:v1" $PWD/docker-selenium-base/.
docker build -t "rajivbhati12/ubuntu_selenium_grid:v1" $PWD/docker-selenium-grid/.

docker build -t "rajivbhati12/ubuntu_selenium_node_base:v1"  $PWD/docker-selenium-node-base/.
docker build -t "rajivbhati12/ubuntu_selenium_node_chrome:v1" $PWD/docker-selenium-node-chrome/.


# Build containers
docker run --name java rajivbhati12/ubuntu_java:v1
docker run -P --name selenium-grid --volumes-from java --volumes-from selenium-base rajivbhati12/ubuntu_selenium_grid:v1
docker run --volumes-from java --volumes-from selenium-base --name selenium-node-chrome --link selenium-grid:hub rajivbhati12/ubuntu_selenium_node_chrome:v1
