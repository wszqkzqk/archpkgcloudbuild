#!/bin/bash
cd `dirname $0`; pwd
git add *
git add .gitignore
git pull
git commit -m 'Updated by update.sh'
git push
