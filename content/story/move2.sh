#!/bin/bash

fn=$1 #current filename
pos=$2 # target position

current_file_pos=$(echo $fn | cut -c 1-2)
#echo "current_file_pos $current_file_pos"
cur_file_name_pos="$current_file_pos"

if [[ $(echo $current_file_pos | cut -c 1) -eq "0" ]]; then 
	current_file_pos=$(echo $current_file_pos | cut -c 2)
fi
#echo $current_file_pos

if [[ $(echo $pos | cut -c 1) -eq "0" ]]; then 
	internal_target_pos=$(echo $current_file_pos | cut -c 2)
else
	internal_target_pos="$pos"
fi

#echo internal_target_pos $internal_target_pos

target_file_pos=$2

# need to transpose the filenme that has that same one

swp_target_file=$(ls "$target_file_pos"* | head -1)
swp_target_basefn=$(echo $swp_target_file | sed -e "s/"$target_file_pos"-//")
cur_basefn=$(echo $fn | cut -c 4-)
new_target_fn="${cur_file_name_pos}-${swp_target_basefn}"
new_cur_fn="${target_file_pos}-${cur_basefn}"

echo swp_target_file $swp_target_file
echo swp_target_basefn $swp_target_basefn
echo new_target_fn $new_target_fn
echo new_cur_fn $new_cur_fn
echo cur_basefn $cur_basefn

#cat $swp_target_file | sed -e "s/order: $cur/order: $current_file_pos/" > $new_target_fn
#cat $fn | sed -e "s/order: $cur/order: $2/" > $new_curn_fn
echo "cat $swp_target_file | sed -e \"s/order: $target_file_pos/order: $current_file_pos/\" > $new_target_fn"
echo "cat $fn | sed -e \"s/order: $current_file_pos/order: ${target_file_pos#0}/\" > $new_cur_fn"
cat $swp_target_file | sed -e "s/order: ${target_file_pos#0}/order: ${current_file_pos#0}/" > $new_target_fn
cat $fn | sed -e "s/order: ${current_file_pos#0}/order: ${target_file_pos#0}/" > $new_cur_fn

rm $fn
rm $swp_target_file


# thought process:
# you two two files the current file and the target file
# modify the current file's position to that of the target file's position
# modify the target file's position (internally) to current file's position
# cp target file to the new position embedded in the filename
# cp the current file to the new position embedded in the filename
# rm old files
