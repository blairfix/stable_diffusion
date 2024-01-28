#!/usr/bin/bash

# instructions: https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/5049?sort=top

#----------------------------------------

# docker
snap install docker
sudo snap refresh docker --channel=latest/edge

# build
#docker-compose build stablediff-cpu
docker-compose build stablediff-cuda


# download model
mkdir stablediff-models stablediff-web
cd stablediff-models/
wget https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt


# run
cd ..
#docker-compose up stablediff-cpu
docker-compose up stablediff-cuda

