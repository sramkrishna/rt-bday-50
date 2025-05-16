#!/bin/bash

files="/var/home/sri/src/rt-bday-50/static/images"
count=1

for i in `ls $files/*.{jpg,jpeg,png} | grep -v mandala | grep -v hero| grep -v rosegold|grep -v thumbnail | grep -v PXL | grep -v cropped `;do
	filename=$(basename -- "$i")
	img=$filename
	extension="${filename##*.}"
	filename="${filename%.*}"

	if [[ $count -lt 10 ]]; then
		countstr="0"${count}
	else
		countstr=${count}
	fi

	title=$(echo $filename | sed -e "s/[-|_]/ /g")
	mdfile="${countstr}"-"${filename}.md"

	cat << eof > $mdfile
---
title: $title
image: "images/$img"
order: $count
---
eof
	count=$((count+1))
done

