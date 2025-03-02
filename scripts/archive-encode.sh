#!/bin/bash

# Archives and encodes
# archive-encode.sh file path/to/folder

name=$1
path=$2
tar -czvf "$name.tar.gz" "$path"
gpg -c "$name.tar.gz"
rm -rf "$name.tar.gz"
