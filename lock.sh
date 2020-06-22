assdasdasdasd#!/usr/bin/env bash
tempbg='/tmp/screen.png'

scrot -o /tmp/screen.png

convert "$tempbg" -filter Gaussian -thumbnail 20% -sample 500% "$tempbg"



i3lock -i "$tempbg"
