#!/bin/sh

# Start some daemons
systemctl enable --now tlp.service
systemctl enable --now swayosd-libinput-backend.service
