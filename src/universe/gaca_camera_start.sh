#!/bin/bash
# GACA AI Pilot Kamera ve Relay Başlatıcı
source /opt/ros/humble/setup.bash
ros2 run usb_cam usb_cam_node_exe --ros-args -p video_device:="/dev/video0" -p image_width:=640 -p image_height:=480 -p pixel_format:="mjpeg2rgb" &
sleep 3
ros2 run topic_tools relay /image_raw /sensing/camera/traffic_light/image_raw
