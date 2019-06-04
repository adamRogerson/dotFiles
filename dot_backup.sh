#!/bin/bash
#Dumb script to be called by cron to backup dot files and push to git if fail will post mail

pushd ~/Software/dotFiles/

rsync -a --exclude '.git' ~/.vim .
rsync -a  ~/.config/fish/functions ./fish

git add .
git commit -m "Auto backup via cron"
git push
popd
