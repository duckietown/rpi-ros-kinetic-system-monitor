#!/bin/bash

docker build -t duckietown/rpi-ros-kinetic-system-monitor:latest ./
docker build -t duckietown/rpi-ros-kinetic-system-monitor:standalone ./standalone/
