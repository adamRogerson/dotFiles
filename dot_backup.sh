#!/bin/bash
#Dumb script to be called by cron to backup dot files and push to git if fail will post mail

cp -r ~/.vim/ ~/Software/dotFiles/.vim
cp -r ~/.config/config.fish ~/Software/dotFiles/fish
cp -r ~/.config/fish/functions ~/Software/dotFiles/fish/function

pushd ~/Software/dotFiles/
git add .
git commit -m "Auto backup via cron"
git push

