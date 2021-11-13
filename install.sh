#!/bin/bash
# Animesh Bala Ani (ANI717)

sudo usermod -aG i2c $USER
./jupyter.sh
./jetbot_stats.sh
./dashing.sh
./pytorch.sh
