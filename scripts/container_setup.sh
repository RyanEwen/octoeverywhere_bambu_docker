#!/bin/bash

./install.sh -bambu
grep 'ExecStart=' /etc/systemd/system/octoeverywhere-bambu.service | sed -r 's/ExecStart=//' > /root/start.sh
chmod +x /root/start.sh
