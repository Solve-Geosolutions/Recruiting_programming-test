#!/bin/bash

. scripts/parse_yaml

create_variables settings.yaml

text="# DVC Tracked Files \n\n
*Files only tracked using DVC are listed "
c=0

for folder in $dvc_folders; do

    tree=$(tree $folder -t -I '*~' |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')

    text+="\n\n## ${folder}\n\n\`\`\`\n ${tree}\n\n\`\`\`"

    c=$((c+1))

done

printf "${text}"

