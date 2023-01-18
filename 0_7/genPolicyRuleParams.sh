#!/bin/bash

for  filename in `ls ./policies/*/policy.json -1`; do
	### fullpath
	# echo FULLPATH  $filename
	### File Name only  no directory path
	#echo BASENAME   :
	#basename $filename
	###Directory Name
	#echo DIRNAME    :
	#dirname  $filename
	###FileName only
        #echo FILENAME  "${filename##*/}"
	###Change filen extention
	#echo FILEEXT ${filename%.*}.params
	cat $filename | jq -r '.properties.policyRule' > ${filename%.*}.rule
	cat $filename | jq -r '.properties.parameters' > ${filename%.*}.params
done

