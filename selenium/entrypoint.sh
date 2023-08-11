#!/bin/bash
export DISPLAY=:1.0
vncserver :1 -geometry 1280x1200
./Selenium-Automation/sbi.py --password2="${SBI_PASSWORD2}" "${SELENIUM_KEY}" "${SBI_USER}" "${SBI_PASSWORD}"
