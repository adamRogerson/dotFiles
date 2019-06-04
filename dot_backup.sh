#!/bin/bash
#Dumb script to be called by cron to backup dot files and push to git if fail will post mail

BACKUP_LOCATION="~/Software/dotFiles"

cp -r ~/.vim .
cp -r ~/.config/fish/functions ./fish 

pushd ~/Software/dotFiles/
git add .
git commit -m "Auto backup via cron"
git push
popd
