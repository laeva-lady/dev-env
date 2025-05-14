#!/bin/sh

git status
git add .
git commit -am "$(date)"
git push
