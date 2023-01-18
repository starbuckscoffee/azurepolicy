#!/bin/bash

for  filename in `ls ./policies/*/policy.json -1`; do
    export PolicyCategory=`cat  $filename | jq -r '.properties.metadata.category'`
    export PolicyDisplayName="`cat $filename | jq -r '.properties.displayName'`"
    export PolicyName="`cat  $filename | jq -r '.name'`"
    az policy definition create --name $PolicyName --display-name "$PolicyDisplayName" --mode Indexed --rules ${filename%.*}.rule --params ${filename%.*}.params  --metadata category=PrivateDnsZoneGroupId
done




