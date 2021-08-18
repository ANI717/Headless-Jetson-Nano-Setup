<p align="center">
  <h1 align="center">Headless Jetson Nano Setup with Micro-USB cable Without Monitor</h1>
</p>

Headless Jetson Nano Setup with with Micro-USB Without Monitor. USB Dongle is required for Wifi Connection .

## Colaborators
[Computer Fusion Laboratory (CFL) - Temple University College of Engineering](https://sites.temple.edu/cflab/people/)
* [Animesh Bala Ani](https://animeshani.com/)
* [Dr. Li Bai](https://engineering.temple.edu/about/faculty-staff/li-bai-lbai)

## Install Jetson Nano Image OS on microSD card
Download **balenaEtcher** from [here](https://www.balena.io/etcher/) and install it.</br>
Install Proper Jetson Nano Image with **balenaEtcher** on a microSD card.</br>

## Boot Jetson Nano
Insert the microSD card to Jetson Nano.</br>
Connect Jetson Nano with a PC/Laptop using Micro-USB cable.</br>
Power On the Jetson Nano and wait for 1-2 minutes.</br>
Download PuTTY from [here](https://www.putty.org/).<br/>
Open Putty, select connection type **serial**.<br/>
The serial line value **COM#** can be found from following in Windows OS.</br>
```
Device Manager > Ports (COM&LPT) > USB Serial Device (COM#)
```
Once connected, go through initial setup until Network Configuration.</br>
Select **dummy0: Unknown Interface**</br>
Once it fails to connect, select **Do not configure....**</br>
Go through rest of the steps with default settings.
Once completed, reboot Jetson Nano.

## Wifi Connection Setup
Open Putty and connect using host name **192.168.55.1**<br/>
Run following command to check wlan device status.</br>
```
nmcli device
```
Run following command and reboot Jetson Nano.</br>
```
sudo systemctl restart network-manager.service
```
Run following command to detect availability of your wifi SSID.</br>
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
Connect using the IP address.<br/>
Once login complete, the Micro-USB cable can be disconnected.

## Install Jupyter Lab
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
