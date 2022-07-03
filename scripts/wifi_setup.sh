#!/bin/bash

sudo systemctl enable --now NetworkManager.service
sudo nmcli device wifi connect "$SSID" password "$SSID_passwd"
