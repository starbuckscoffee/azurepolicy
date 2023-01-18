# Brief Description of this Folder

Filename: <storing>genPolicyRuleParams.sh</storing>
 Type: Bash Script (run it on linux OS)
  This script was used for generating a set of files, i.e. policy rule and policy params
  you do not need to run the script because files(rule and params) were already generated and in the repository

  Run the script at this directory if you want to run the script again

# Memo -- how to generate policyDefinisionSet.templatem & policyDefinisionParams.json

> cd initiatives/PolicySet_Create_private_endpoint_resources_from_multiple_groupIds_a5fbbce0c02949b69f14ec4e
> cat policyset.json | jq -r 'properties.policyDefinitions' | sed s/d9580795-79e6-48ed-95a0-c2ae49686f55/__your_subscription_id__/g > policyDefinisionSet.template
> cat policyset.json | jq -r '.properties.parameters'  > policyDefinisionParams.json
> cd ../../


# How to Deploy Azure Policy using Azure CLI
  
-- List Environments (Category, DisplayName, PolicyName)

export PolicyCategory=`cat policy.json | jq -r '.properties.metadata.category'`
export PolicyDisplayName="`cat policy.json | jq -r '.properties.displayName'`"
export PolicyName="`cat  policy.json | jq -r '.name'`"


-- Deploy policy using Azure CLI

>az policy definition create \\
>  
>--name $PolicyName --mode Indexed \\
>
>  --display-name $PolicyDisplayName \\
>
>  --rules policy.rule \\
>
>  --params policy.params \\
>
>  --subscription "refer-to-your-subscription-name"


-- Check if policy was created

>az policy definition show --name $PolicyName

-- Delete the policy if you do not use it anymore

>az policy definition delete --name $PolicyName


# How to Deploy Azure Policy Initiative using Azure CLI

--Deploy Policy Initiative using Azure CLI

>az policy set-definition create --definitions ./policyDefinisionSet.json  \\
>
>  --name starbucks1policyset \\
>
> --description "It is testing use for Policy Initiative" \\
>
>  --display-name "starbucks1policyset" \\
>
>  --metadata category=PrivateDnsZoneGroupId \\
>
>  --params ./policyDefinisionParams.json \\
>
>  --subscription "refer-to-your-subscription-name"





