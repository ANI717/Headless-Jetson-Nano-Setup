<p align="center">
  <h1 align="center">Headless Jetson Nano Setup with JupyterLab Support</h1>
</p>

Headless Jetson Nano setup with with Micro-USB cable Without Using Monitor. USB Dongle is required for Wifi Connection. JupyterLab setup included. ROS2 Dasing Installation Included. 

## Colaborators
[Animesh Bala Ani](https://animeshani.com/)

## Install Jetson Nano Image OS on microSD card
Download [balenaEtcher](https://www.balena.io/etcher/) and install it.</br>
Download the latest [Jetson Nano Developer Kit SD Card Image](https://developer.nvidia.com/embedded/downloads), and write it on a microSD card with **balenaEtcher**.</br>

## Boot Jetson Nano
Insert the microSD card to Jetson Nano.</br>
Connect Jetson Nano with a PC/Laptop using Micro-USB cable.</br>
Power On the Jetson Nano and wait for 1-2 minutes.</br>
Download [PuTTY](https://www.putty.org/).<br/>
Open **Putty**, select connection type **serial**.<br/>
The serial line value `COM#` can be found from following in Windows OS.</br>
```
Device Manager > Ports (COM&LPT) > USB Serial Device (COM#)
```
Once connected, go through initial setup until Network Configuration.</br>
Select `dummy0: Unknown Interface`</br>
Once it fails to connect, select `Do not configure the network at this time`</br>
Go through the rest of the steps with the default settings.
Once completed, wait couple of minutes and go to next step.

## Wifi Connection Setup
Open Putty and connect using host name `192.168.55.1` or using COM Port<br/>
Run following command and reboot Jetson Nano.</br>
```
sudo systemctl restart network-manager.service
```
Log into Jetson Nano and run following command to detect availability of your wifi SSID.</br>
```
nmcli device wifi list
```
Connect to wifi using following command.</br>
```
sudo nmcli device wifi connect <SSID> password <Wifi_Password>
```
Run following command to get the IP address (2nd one).</br>
```
hostname -I
```
Open Putty and connect using the IP address.<br/>
Once login completes, the Micro-USB cable can be disconnected.

## Install Jupyter Lab
Run following commands to install JupytarLab.
```
cd ~
sudo apt update
sudo apt install -y python3-pip curl libffi-dev
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs
python3 -m pip install setuptools cffi git+https://github.com/ipython/traitlets@4.x

python3 -m pip install jupyter jupyterlab
export PATH=$PATH:~/.local/bin
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install @jupyterlab/statusbar
```

Setup I2C connection and other required packages.
```
sudo apt update && sudo apt upgrade -y
sudo usermod -aG i2c $USER
sudo apt-get update
sudo apt install python3-pip python3-pil -y
```
Setup Jupytar Lab
```
cd ~/
sudo apt install python3-smbus curl cmake -y
git clone https://github.com/lbaitemple/jetbot_nividia_nano
cd ~/jetbot_nividia_nano
sudo python3 setup.py install
chmod +x jupyter.sh
./jupyter.sh 
```
