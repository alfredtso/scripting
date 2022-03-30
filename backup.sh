#!/bin/bash

# change the target directory
cd /home/alfred/Github/scripting/test
echo "$PWD"

echo "---Back up script---"

FILES=$(ls | grep -E ".txt$")
FILENAME=$(date -u +"%d_%h_%Y").tar.gz

echo "Going to back up"
echo "1. Create gzipped archive for these files..."
echo "$FILES"
echo "Target: $FILENAME"

tar czf $FILENAME $FILES

if [[ -e $FILENAME ]]; then
	echo "$FILENAME has successfully created"
fi

echo "2. SCP to remote host"
scp -v -P 60022 -i /home/alfred/.ssh/id_rsa $FILENAME alfred@127.0.0.1:/home/alfred/backup/$FILENAME

if [[ $? -eq 0 ]]; then
	echo "scp has been successful"
else
	echo "something's wrong; scp exit status non-zero"
fi






