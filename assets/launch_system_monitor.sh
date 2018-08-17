#!/usr/bin/env bash

# source ROS and code
source /opt/ros/$ROS_DISTRO/setup.bash
source /home/software/catkin_ws/devel/setup.bash

# launch system monitor
roslaunch --wait /root/system_monitor.launch
