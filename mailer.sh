#!/bin/bash
# This script installs the packages necessary to allow the Pi
# to send email VIA AN EXISTING ACCOUNT. It will not work as
# a mail server or forwarder, but it can send SMTP mail from
# this machine.
sudo apt-get install ssmtp mailutils
