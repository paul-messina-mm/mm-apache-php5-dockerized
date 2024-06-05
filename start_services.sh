#!/bin/bash
# Start rsyslog
service rsyslog start
# Start Apache in the foreground
/usr/sbin/apache2ctl -D FOREGROUND
