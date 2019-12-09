#!/bin/sh
# This script will read available drives and display
# a list of drives that can be mounted

getmount() {
  [ -z "$chosen" ] && exit 1
  mp="$(find $1 2>/dev/null | dmenu -i -p "Type in mount point")"
  [ "$mp" = "" ] && exit 1
  if [! -d "$mp" ]; then
    uhh=$(printf "No\\nYes" | dmenu -i -p "$mp does not exist. Create it?")
    [ "$uhh" = "Yes" ] && (mkdir -p "$uhh" || sudo -A mkdir -p "$uhh")
  fi
}

mountusb() {
  chosen="$(echo "$usbdrives" | dmenu -i -p "Mount which drive?" | awk '{print $1}')"
  sudo -A mount "$chosen" 2>/dev/null && notify-send "USB Mounting" "$chosen mounted." && exit 0

}


usbdrives="$(lsblk -rpo "name,type,size,mountpoint" | awk '$2=="part"&&$4==""{printf "%s (%s)\n",$1,$3}')"

if [ -z "$choice" ]; then
  echo "USB drive(s) detected"
  mountusb
fi