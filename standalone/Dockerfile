# Base image
FROM afdaniele/ros-system-monitor:latest

# enable ARM
RUN [ "cross-build-start" ]

# install packages
RUN apt-get update && apt-get install -q -y \
	ros-$ROS_DISTRO-rosbridge-server \
    && rm -rf /var/lib/apt/lists/*

# copy launch scripts
COPY assets/launch_system_monitor.sh /root/launch_system_monitor.sh
COPY assets/webserver_sysmonitor.launch /root/webserver_sysmonitor.launch
RUN ["chmod", "+x", "/root/launch_system_monitor.sh"]

# disable ARM
RUN [ "cross-build-end" ]

# configure entrypoint
ENTRYPOINT ["/ros_entrypoint.sh", "/root/launch_system_monitor.sh"]
