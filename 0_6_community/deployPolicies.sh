#!/bin/bash

for  filename in `ls ./policies/*/policy.json -1`; do
    export PolicyCategory=`cat  $filename | jq -r '.properties.metadata.category'`
    echo $PolicyCategory
    export PolicyDisplayName="`cat $filename | jq -r '.properties.displayName'`"
    echo $PolicyDisplayName
    export PolicyName="`cat  $filename | jq -r '.name'`"
    echo $PolicyName
    az policy definition create --name $PolicyName --display-name $PolicyDisplayName --mode Indexed --rules ${filename%.*}.rule --params ${filename%.*}.params  
done




