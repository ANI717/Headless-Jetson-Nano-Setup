#!/bin/bash
# Animesh Bala Ani (ANI717)

# exit immediately if a command exits with a non-zero status.
set -e

# record script start time
date

# install dependency
sudo apt-get update && sudo apt-get install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt-get update && sudo apt-get install -y curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# install ros2 dashing
sudo apt-get update
sudo apt-get install -y ros-dashing-desktop python3-colcon-common-extensions python-rosdep
sudo rosdep init
rosdep update

# source ros2 dashing
source /opt/ros/dashing/setup.bash
echo  'source /opt/ros/dashing/setup.bash' >> ~/.bashrc 

# record script end time
date
