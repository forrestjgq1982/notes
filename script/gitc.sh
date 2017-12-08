#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage $0 <github_rep>"
    exit 1
fi

rep=$1

if [ -e $rep ]; then
    echo "$rep already exist, exit"
    exit 2
fi

mkdir $rep
cd $rep

echo "-- init"
git init

echo "-- add remote"
git remote add origin git@github.com:forrestjgq/$rep.git

echo "-- pull"
git pull origin master
