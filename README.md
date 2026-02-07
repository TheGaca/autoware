### 1. Terminal: Ağ Yapılandırması ve RViz (Donanım Hazırlığı)

```bash
source /opt/ros/humble/setup.bash

# Ethernet kartı IP yapılandırması (LiDAR iletişimi için)
sudo ip addr flush dev enp5s0
sudo ip addr add 192.168.3.100/24 dev enp5s0
sudo ip link set enp5s0 up

# Görselleştirme arayüzü
rviz2

```

### 2. Terminal: RoboSense LiDAR Sürücüsü

```bash
cd ~/ros2_ws
source install/setup.bash
ros2 launch rslidar_sdk start.py

```

### 3. Terminal: Autoware Simülasyonu (Atölye Haritası ile)

```bash
cd ~/autoware
source install/setup.bash
ros2 launch autoware_launch planning_simulator.launch.xml \
  map_path:=$HOME/autoware_map/benim_haritam \
  vehicle_model:=sample_vehicle \
  sensor_model:=sample_sensor_kit

```

### 4. Terminal: Kamera Sürücüsü (GACA Kamera Entegrasyonu)

Kamerayı Autoware Perception modülünün beklediği formatta başlatmak için bu parametreleri kullanmalısın:

```bash
source /opt/ros/humble/setup.bash
ros2 run usb_cam usb_cam_node_exe --ros-args \
  -p video_device:="/dev/video0" \
  -p image_width:=640 \
  -p image_height:=480 \
  -p pixel_format:="mjpeg2rgb" \
  -p camera_name:="front_camera" \
  -p frame_id:="camera_link" \
  -r /image_raw:=/sensing/camera/traffic_light/image_raw

```

### Önemli Notlar:

* **Topic Yönlendirme:** Son komuta eklediğim `-r /image_raw:=/sensing/camera/traffic_light/image_raw` kısmı, kamera görüntüsünü doğrudan Autoware'in "Traffic Light Recognition" panelinde görebilmeni sağlar.
