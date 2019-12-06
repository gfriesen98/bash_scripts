#!/bin/sh
# This script will read my mounted external hdd and make a dmenu list of videos and folders
# and play the folder/video in mpv
# Author: Garett Friesen



main_select (){
  choice=$(echo -e "UNWATCHED\nWATCHED" | dmenu -i -nb '#191919' -nf '#ff84b3' -sb '#ff84b3' -sf '#191919' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
  play_video
}

play_video (){
  if [[ $choice == "UNWATCHED" ]]
  then
    #mpv "$(ls -d /run/media/compute/external/ANIME/UNWATCHED/* | dmenu -l 15 -nb '#191919' -nf '#ff84b3' -sb '#ff84b3' -sf '#191919' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')"
    path=$(ls -d /run/media/compute/external/ANIME/UNWATCHED/* | dmenu -l 15 -nb '#191919' -nf '#ff84b3' -sb '#ff84b3' -sf '#191919' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
    if [[ $path != '' ]]
    then
      mpv "$path"
    else
      main_select
    fi
  elif [[ $choice == "WATCHED" ]]
  then
    path=$(ls -d /run/media/compute/external/ANIME/WATCHED/* | dmenu -l 15 -nb '#191919' -nf '#ff84b3' -sb '#ff84b3' -sf '#191919' -fn 'UbuntuMono Nerd Font Mono:bold:pixelsize=16')
    if [[ $path != '' ]]
    then
      mpv "$path"
    else 
      main_select
    fi
  fi
}


main_select



