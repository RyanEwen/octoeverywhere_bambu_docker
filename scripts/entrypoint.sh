#!/bin/bash

# generate json to pass to octoeverywhere installer
PY_LAUNCH_JSON=$(jq -n \
    --arg REPO_DIR "$REPO_DIR" \
    --arg VENV_DIR "$VENV_DIR" \
    --arg USER "$USER" \
    --arg HOME "$HOME" \
    --arg CMD_LINE_ARGS "-bambu" \
    '{ OE_REPO_DIR: $REPO_DIR, OE_ENV: $VENV_DIR, USERNAME: $USER, USER_HOME: $HOME, CMD_LINE_ARGS: $CMD_LINE_ARGS }' )

# start octoeverywhere installer
# credit to https://github.com/ntebis/octoeverywhere_bambulab_docker for the way these get passed into the installer
(echo ${ACCESS_CODE}; echo ${SERIAL_NUMBER}; echo "y" ; echo ${IP_ADDRESS}) | ${VENV_DIR}/bin/python3 -B -m py_installer ${PY_LAUNCH_JSON} || true

# grab the start command from the service file and put it into its own script
grep 'ExecStart=' /etc/systemd/system/octoeverywhere-bambu.service | sed -r 's/ExecStart=//' > /root/start.sh && chmod +x /root/start.sh

# start the service
/root/start.sh
