#!/bin/bash

sudo cp configs/reflector/reflector.conf /etc/xdg/reflector/reflector.conf
sudo systemctl enable --now reflector.timer


