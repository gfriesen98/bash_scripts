#!/bin/bash

cp ~/.cache/wal/colors.scss ~/Documents/Projects/Web/gfriesen98.github.io/styles/colors.scss

cd ~/Documents/Projects/Web/gfriesen98.github.io

sass styles/sass.scss styles.css

git add .
git commit -m "Updated styles"
git push -u origin master
