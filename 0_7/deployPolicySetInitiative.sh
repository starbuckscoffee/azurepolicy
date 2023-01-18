#!/bin/bash

for  filename in `ls ./initiatives/*/policyset.json -1`; do
    export PolicySetName="`cat  $filename | jq -r '.name'`"
    export SubscriptionId="`az account show | jq -r '.id'`"
    export PolicySetDescription="`cat $filename | jq -r '.properties.description'`"
    export PolicySetName="`cat $filename | jq -r '.name'`"
    export PolicySetDisplayName="`cat $filename | jq -r '.properties.displayName'`"
    export PolicySetDirname="`dirname $filename`"
    ## replace  __your_subscription_id__  to $SubscriptionId ##
    sed s/__your_subscription_id__/${SubscriptionId}/g  $PolicySetDirname/policyDefinisionSet.template > $PolicySetDirname/policyDefinisionSet.json
    az policy set-definition create --definitions "$PolicySetDirname/policyDefinisionSet.json" --name $PolicySetName --description  "$PolicySetDescription" --display-name "$PolicySetDisplayName" --metadata category=PrivateDnsZoneGroupId --params $PolicySetDirname/policyDefinisionParams.json
done
