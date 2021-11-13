#!/bin/bash
# Animesh Bala Ani (ANI717)

# exit immediately if a command exits with a non-zero status.
set -e

# set default password
password='jetbot'

# record script start time
date

# install dependency
sudo apt-get update
sudo apt-get install -y python3-pip curl libffi-dev
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo -H pip3 install --upgrade pip setuptools
sudo -H pip3 install cffi

# install jupyterlab
sudo -H pip3 install jupyter jupyterlab
sudo -H jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter lab --generate-config
python3 -c "from notebook.auth.security import set_password; set_password('$password', '$HOME/.jupyter/jupyter_notebook_config.json')"

# set configuration
echo "c.NotebookApp.token = ''" >> $HOME/.jupyter/jupyter_lab_config.py
echo "c.NotebookApp.password_required = True" >> $HOME/.jupyter/jupyter_lab_config.py
echo "c.NotebookApp.allow_credentials = False" >> $HOME/.jupyter/jupyter_lab_config.py

# create jupyter service
python3 create_jupyter_service.py
sudo mv jetbot_jupyter.service /etc/systemd/system/jetbot_jupyter.service
sudo systemctl enable jetbot_jupyter
sudo systemctl start jetbot_jupyter

# record script end time
date
