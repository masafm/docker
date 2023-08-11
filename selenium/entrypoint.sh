#!/bin/bash
export DISPLAY=:1.0
vncserver :1 -geometry 1280x1200
./Selenium-Automation/sbi.py --password2="${PASSWORD2}" "${KEY}" "${USER}" "${PASSWORD}"
