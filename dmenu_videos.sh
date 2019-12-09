#!/bin/sh
# This script will read my mounted external hdd and make a dmenu list of videos and folders
# and play the folder/video in mpv
# Author: Garett Friesen

# Displays what initial folder to select

main_select_two_electric_boogaloo (){
  folders=$(echo -e "ANIME\nMOVIES" | dmenu -p "🎬?" -nb '#191919' -nf '#ff84b3' -sb '#ff84b3' -sf '#191919' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
  if [[ $folders != '' ]]
  then
    choice=$(echo -e "UNWATCHED\nWATCHED" | dmenu -p "🎬?" -i -nb '#191919' -nf '#ff84b3' -sb '#ff84b3' -sf '#191919' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
    if [[ $choice != '' ]]
    then
      path=$(ls -d /run/media/compute/external/${folders}/${choice}/* | dmenu -p "🎬 What Video?" -i -l 15 -nb '#191919' -nf '#ff84b3' -sb '#ff84b3' -sf '#191919' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
      if [[ $path != '' ]]
      then 
        mpv $path
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



