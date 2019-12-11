#!/bin/sh
# This script will read my mounted external hdd and make a dmenu list of videos and folders
# and play the folder/video in mpv
# Author: Garett Friesen

# Displays what initial folder to select

main_select_two_electric_boogaloo (){
  drive=$(df -h | awk '{print $6}' | grep -v "Mounted" | dmenu -l 10 -p "Select Drive")
  # TODO
  # Add functionality to select a mounted drives path to videos folder
  folders=$(echo -e "ANIME\nMOVIES" | dmenu -p "🎬?" -nb '#000000' -nf '#bcb1a3' -sb '#1c3b56' -sf '#bcb1a3' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
  if [[ $folders != '' ]]
  then
    choice=$(echo -e "UNWATCHED\nWATCHED" | dmenu -p "🎬?" -i -nb '#000000' -nf '#bcb1a3' -sb '#1c3b56' -sf '#bcb1a3' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
    if [[ $choice != '' ]]
    then
      path=$(ls -d /run/media/compute/external/${folders}/${choice}/* | dmenu -p "🎬 What Video?" -i -l 15 -nb '#000000' -nf '#bcb1a3' -sb '#1c3b56' -sf '#bcb1a3' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
      if [[ $path != '' ]]
      then 
        mpv $path
        notify-send "🎬 ${choice} is playing"
      else
        main_select_two_electric_boogaloo
      fi
    else
      main_select_two_electric_boogaloo
    fi
  else 
    exit
  fi
}

main_select_two_electric_boogaloo



