#!/usr/bin/env bash

. scripts/parse_yaml

create_variables settings.yaml

#git init
dvc init
mkdir -p dvc
for VARIABLE in $dvc_folders
do
    dvc add $VARIABLE --file dvc/$VARIABLE.dvc 
done
dvc remote add -d $project_name  $dvc_remote 
. scripts/list_files.sh > dvc_files.md
find . -type f ! -path "./.git/*" ! -path "./.dvc/*"> files.txt
cp scripts/pre-commit .git/hooks/pre-commit
echo "desktop.ini" | tee -a  .gitignore > /dev/null
git add .
git commit -m "Initial commit"



