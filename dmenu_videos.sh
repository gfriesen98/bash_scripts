#!/bin/sh
# This script will read my mounted external hdd and make a dmenu list of videos and folders
# and play the folder/video in mpv
# Author: Garett Friesen

main_select_two_electric_boogaloo (){
  drive=$(df -h | awk '{print $6}' | grep -v "Mounted" | dmenu -l 10 -p "Select mnt'd dir." -l 10 -nb '#000000' -nf '#bcb1a3' -sb '#1c3b56' -sf '#bcb1a3' -fn 'GohuNew:bold:pixelsize=16')
  # TODO
  # Add functionality to select a mounted drives path to videos folder
  # folders=$(echo -e "ANIME\nMOVIES" | dmenu -p "Select Type" -nb '#000000' -nf '#bcb1a3' -sb '#1c3b56' -sf '#bcb1a3' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
  folders=$(ls -d ${drive}/* | dmenu -p "Select Folder" -l 10 -nb '#000000' -nf '#bcb1a3' -sb '#1c3b56' -sf '#bcb1a3' -fn 'GohuNew:bold:pixelsize=16')
  if [[ $folders != '' ]]
  then
    #choice=$(echo -e "UNWATCHED\nWATCHED" | dmenu -p "Select Watch Type" -i -nb '#000000' -nf '#bcb1a3' -sb '#1c3b56' -sf '#bcb1a3' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
    choice=$(ls -d ${folders}/* | dmenu -l 10 -nb '#000000' -nf '#bcb1a3' -sb '#1c3b56' -sf '#bcb1a3' -fn 'GohuNew:bold:pixelsize=16')
    if [[ $choice != '' ]]
    then
      path=$(ls -d ${choice}/* | dmenu -p "🎥 What Video?" -i -l 15 -nb '#000000' -nf '#bcb1a3' -sb '#1c3b56' -sf '#bcb1a3' -fn 'GohuNew:bold:pixelsize=16')
      if [[ $path != '' ]]
      then 
        notify-send "🎬 ${path} is playing"
        mpv "$path"
        exit
      else
        exit
      fi
    else
      exit
    fi
  else 
    exit
  fi
}

main_select_two_electric_boogaloo