branch=$(shell git rev-parse --abbrev-ref HEAD)

name=duckietown/rpi-ros-kinetic-system-monitor:$(branch)

build:
	docker build -t $(name) .

push:
	docker push $(name)
