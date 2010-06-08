#!/bin/sh

sudo tail -f /var/log/messages | osd_cat -p bottom -A center -l 2 -w

# ---

