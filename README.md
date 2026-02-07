source /opt/ros/humble/setup.bash
rviz2

# ip eşitleme
sudo ip addr flush dev enp5s0
sudo ip addr add 192.168.3.100/24 dev enp5s0
sudo ip link set enp5s0 up
# lidar surucusu (zorumlu)
cd ~/ros2_ws
source install/setup.bash
ros2 launch rslidar_sdk start.py

  
 
#  atolye haritasi ile 
cd ~/autoware
source install/setup.bash
ros2 launch autoware_launch planning_simulator.launch.xml \
map_path:=$HOME/autoware_map/benim_haritam \
vehicle_model:=sample_vehicle \
sensor_model:=sample_sensor_kit

# camerayi içeriye aktarma autoware açikken iki terminal daha aç birincisine 

 source /opt/ros/humble/setup.bash
ros2 run usb_cam usb_cam_node_exe --ros-args \
-p video_device:="/dev/video0" \
-p image_width:=640 \
-p image_height:=480 \
-p pixel_format:="mjpeg2rgb" \
-p camera_name:="front_camera" \
-p frame_id:="camera_link"
