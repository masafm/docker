#!/bin/bash
export DISPLAY=:1.0
export $(dbus-launch)
vncserver :1 -geometry 1280x1200
./Selenium-Automation/sbi.py "${KEY}" "${USER}" "${PASSWORD}"
