#!/bin/bash
#Dumb script to be called by cron to backup dot files and push to git if fail will post mail

cp -r ~/.vim/ ~/Software/dotFiles/.vim
cp -r ~/.config/fish ~/Software/dotFiles/fish

pushd ~/Software/dotFiles/


