#! /bin/bash

# Languages list
# 0 : English
# 1 : 
# 2 : 
# 3 : 
# 4 : 
# 5 : 
# 6 : 
# 7 : French
# 8 : 
# 9 : 
# 10 : 
# 11 : 
# 12 : 
# 13 : 

language=0
targetdir="$HOME/.steam/steam/steamapps/common/Spyro Reignited Trilogy/Falcon/Content/Movies/"
backupdir="$HOME/.steam/steam/steamapps/common/Spyro Reignited Trilogy/Falcon/Content/Movies_backup/"

# Check if required packages are missing
missing_req=0
if ! command -v ffmpeg &> /dev/null; then
	echo "Missing required package: ffmpeg"
	missing_req=1
fi
if ! command -v mediainfo &> /dev/null; then
	echo "Missing required package: mediainfo"
	missing_req=1
fi
if [ $missing_req -eq 1 ]; then
	exit 127
fi

# Create backup if there isn't one
if [ ! -d "$backupdir" ]; then
	mv "$targetdir" "$backupdir"
# Delete target if backup is detected
elif [ $(ls "$backupdir" -p | grep -v / | wc -l) == "77" ]; then
	if [ -d "$targetdir" ]; then rm -r "$targetdir"; fi
# If backup points to an empty directory create a new backup from target
elif [ $(ls "$backupdir" -p | grep -v / | wc -l) == "0" ]; then
	rm "$backupdir"
	mv "$targetdir" "$backupdir"
else
	echo "Exiting most likely because an incorrect number of files was detected. If this was intentional then modify "77" to the correct number of files"
	exit 0
fi
		
mkdir "$targetdir"

for file in "${backupdir}"*
do
	if mediainfo --output=XML "$file" | grep -q "<ID>4</ID>"; then
		ffmpeg -loglevel error -stats -i "$file" -map 0:a:"$language" -map 0:v:0 -c:a copy -c:v copy "${file/$backupdir/$targetdir}"
	else 
		cp "$file" "${file/$backupdir/$targetdir}"
	fi
done
