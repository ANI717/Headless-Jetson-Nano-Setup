#!/bin/bash
# Animesh Bala Ani (ANI717)

# exit immediately if a command exits with a non-zero status.
set -e

# record script start time
date

# install dependency
sudo apt-get update
sudo apt-get install -y python3-pip python3-setuptools python3-pil
sudo -H pip3 install --upgrade pip
sudo -H pip3 install Adafruit_SSD1306

# create jetbot_stats service
python3 create_stats_service.py
sudo mv jetbot_stats.service /etc/systemd/system/jetbot_stats.service
sudo cp jetbot_stats.py /etc/systemd/system/jetbot_stats.py
sudo systemctl enable jetbot_stats
sudo systemctl start jetbot_stats

# record script end time
date
