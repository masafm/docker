#!/bin/bash
export DISPLAY=:1.0
vncserver :1 -geometry 1280x1200 -localhost no
./sbi.py --password2="${SBI_PASSWORD2}" "${SELENIUM_KEY}" "${SBI_USER}" "${SBI_PASSWORD}"
./mufj.py --password2="${MUFJ_PASSWORD2}" "${SELENIUM_KEY}" "${MUFJ_USER}" "${MUFJ_PASSWORD}"
./mizuho.py --password2="${MIZUHO_PASSWORD2}" "${SELENIUM_KEY}" "${MIZUHO_USER}" "${MIZUHO_PASSWORD}"
./daiwa.py --password2="${DAIWA_PASSWORD2}" --store="${DAIWA_STORE}" "${SELENIUM_KEY}" "${DAIWA_USER}" "${DAIWA_PASSWORD}"
./smbc_nikko.py --password2="${SMBC_PASSWORD2}" --store="${SMBC_STORE}" "${SELENIUM_KEY}" "${SMBC_USER}" "${SMBC_PASSWORD}"
