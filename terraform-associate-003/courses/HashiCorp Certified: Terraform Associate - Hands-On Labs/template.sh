#!/bin/bash

uri=$1
if [ -z $uri ]; then
    echo "Usage: $0 uri"
    exit 1
fi

echo "Downloading file..."
file=$(mktemp)
curl $1 --output $file

echo "Extracting Tasks..."
tasks=$(cat $file | grep "\- Task")

echo "Getting filename..."
filename=$(echo $uri | sed -r "s/.*\/(.*)/\1/g" | sed -r "s/%20/ /g")

echo "Extracting lesson number..."
number=$(($(echo $filename | cut -d " " -f1) + 8))

echo "Extracting summary..."
summary=$(cat $file | grep "# Lab" | sed -r "s/# Lab: (.*)/\1/g")

echo "Writing template..."
folder="$number-$summary"
mkdir "$folder"
cat <<EOF > "$folder/README.md"
# Lesson $number - $summary

## Tasks

$tasks

## Reference

- [$filename]($uri)

EOF
cat <<EOF > "$folder/main.tf"
/*
$summary

$tasks
*/

terraform {
    required_version = ">= 1.0"
}

EOF

echo "Done!"
