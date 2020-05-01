#!/bin/sh
source "/home/garett/.cache/wal/colors.sh"
printf "%s\n" "$color0"

folder=$(ls -d ~/Pictures/Papes/Anime_Papes/* | dmenu -l 10 -p Select)
if [[ $folder == '' ]]
then
  exit
fi

wal -i $folder
notify-send "Wallpaper & Color Scheme Set"

sleep 2

convert $wallpaper -resize 250x250^ -gravity center -extent 250x250 -quality 90 /home/garett/Documents/Projects/Web/gfriesen98.github.io/cropped.png

notify-send "Cropped Wallpaper"

sleep 2

cp ~/.cache/wal/colors.scss ~/Documents/Projects/Web/gfriesen98.github.io/styles/colors.scss

cd ~/Documents/Projects/Web/gfriesen98.github.io

sass styles/sass.scss styles.css

git add .
git commit -m "Updated styles"
echo -n "/home/garett/Documents/Projects/Web/gfriesen98.github.io" | xclip -selection primary
notify-send "Updated startpage, just need to push."


