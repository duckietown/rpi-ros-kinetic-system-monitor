# Base image
FROM duckietown/rpi-ros-kinetic-base:master18

# parameters
ENV CPU_MONITOR true
ENV HDD_MONITOR false
ENV MEM_MONITOR true
ENV NTP_MONITOR false
ENV NET_MONITOR false
ENV CONFIG default

# enable ARM
RUN [ "cross-build-start" ]

# install packages
RUN apt update \
  && apt install -q -y \
  	ntpdate \
  	sysstat \
  && rm -rf /var/lib/apt/lists/*

# build system_monitor
RUN mkdir -p /home/software/catkin_ws/src
RUN git clone https://github.com/afdaniele/ros-system-monitor /home/software/catkin_ws/src/ros-system-monitor
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
  && catkin_make -C /home/software/catkin_ws

# copy configure and launch script
COPY assets/* /root/

# disable ARM
RUN [ "cross-build-end" ]

# configure entrypoint
ENTRYPOINT ["/ros_entrypoint.sh", "/root/launch_system_monitor.sh"]
