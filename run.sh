#!/usr/bin/env bash


SERVERS_DIR=/tmp/.X11-unix
SNAPSHOT=$(mktemp)
ls $SERVERS_DIR >$SNAPSHOT

echo "Starting Display Server"
xvfb-run -a -s "-screen 0 1920x1080x8" ./target/release/wtftw &
sleep 1

SERVER=$(comm -23 <(ls $SERVERS_DIR) $SNAPSHOT | sed -e "s/X//g")

echo "Starting VNC Server"
x11vnc -display :$SERVER -bg -nopw -listen localhost -xkb
vncviewer localhost
