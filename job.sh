#!/bin/bash

git remote add upstream https://github.com/docker-library/postgres
git fetch upstream
status=`git status`
if [[ $status == *"nothing to commit"* ]]
then
   echo "No se necesita actualizar";
else
#echo "Necesitas actualizar";
 git checkout master
 git merge upstream/master
 git push #dispara el evento del quay.io
fi
