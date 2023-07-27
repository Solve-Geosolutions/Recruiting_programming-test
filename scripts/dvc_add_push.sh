#!/usr/bin/env bash

. scripts/parse_yaml

create_variables settings.yaml

for VARIABLE in $dvc_folders
do
    dvc add $VARIABLE --file dvc/$VARIABLE.dvc 
done
dvc push