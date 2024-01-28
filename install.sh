#!/usr/bin/bash

# instructions: https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/5049?sort=top

#----------------------------------------

# docker
snap install docker
sudo snap refresh docker --channel=latest/edge

# download model
cd stablediff-models/

wget https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt




# build
docker-compose build stablediff-cpu

# run
docker-compose up stablediff-cpu

