#!/bin/bash

systemctl enable --now NetworkManager.service
nmcli device wifi connect "$SSID" password "$passwd"
