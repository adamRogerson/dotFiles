#!/bin/bash
#Dumb script to be called by cron to backup dot files and push to git if fail will post mail

pushd ~/Personal/dotFiles/

rsync -a --exclude '.git' ~/.vim .

git add .
git commit -m "Auto backup via cron"
git push
popd
