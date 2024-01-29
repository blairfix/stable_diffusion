#!/usr/bin/bash

# instructions: https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/5049?sort=top


# docker
#----------------------------------------

sudo snap install docker
sudo snap refresh docker --channel=latest/edge


# nvidia 
#----------------------------------------

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update

sudo apt-get install -y nvidia-container-toolkit

# configure docker
#----------------------------------------
#
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker


# build
#----------------------------------------

docker-compose build stablediff-cuda


# download model
#----------------------------------------

mkdir stablediff-models stablediff-web
cd stablediff-models/
wget https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt


# run
#----------------------------------------

cd ..
docker-compose up stablediff-cuda

