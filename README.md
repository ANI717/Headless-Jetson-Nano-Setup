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
The serial line value **COM#** can be found from following in windows.</br>
```
Device Manager > Ports (COM&LPT) > USB Serial Device (COM#)
```
Once connected, go through initial setup until network connection.</br>
