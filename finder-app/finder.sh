#!/bin/bash


if [ "$#" -ne 2 ]; then 
    cat <<EOF >&2
ERROR: Invalid Number Of Arguments,
Total number of arguments should be 2.
    1) Path to folder, 
    2) Search string
EOF
    exit 1
fi
 
folder_path=$1
search_string=$2

if [ ! -d "$folder_path" ]; then
    echo "ERROR: Folder '$folder_path' does not exist." >&2
    exit 1
fi

total_match_count=0
total_file_count=0
 
shopt -s globstar

for file in "$folder_path"/**/*; do 
if [[ -f "$file" ]]; then
        echo "$file \n"
        match_count=$(grep -c "$search_string" "$file" )
        total_match_count=$((total_match_count + $match_count))
        total_file_count=$((total_file_count + 1))
    fi 
done

echo "The number of files are $total_file_count and the number of matching lines are $total_match_count"