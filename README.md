source /opt/ros/humble/setup.bash
rviz2



# Mevcut hatalı IP'yi temizle
sudo ip addr flush dev enp5s0

# LiDAR'ın beklediği doğru IP'yi ata
sudo ip addr add 192.168.3.100/24 dev enp5s0

# Arayüzü yukarı çek (aktif et)
sudo ip link set enp5s0 up

cd ~/ros2_ws
source install/setup.bash
ros2 launch rslidar_sdk start.py



cd autoware
source install/setup.bash
ros2 launch autoware_launch planning_simulator.launch.xml \
  map_path:=$HOME/autoware_map/sample-map-planning \
  vehicle_model:=sample_vehicle \
  sensor_model:=sample_sensor_kit
  
  
 ayni şekilde ama bizim harita açilir 
 
 ros2 launch autoware_launch planning_simulator.launch.xml \
  map_path:=$HOME/autoware_map/benim_haritam \
  vehicle_model:=sample_vehicle \
  sensor_model:=sample_sensor_kit
