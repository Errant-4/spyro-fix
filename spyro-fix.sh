#! /bin/bash

language=0
targetdir="$HOME/.steam/steam/steamapps/common/Spyro Reignited Trilogy/Falcon/Content/Movies/"
backupdir="$HOME/.steam/steam/steamapps/common/Spyro Reignited Trilogy/Falcon/Content/Movies_backup/"

#Back up original files or delete current Movie folder if a backup directory is deteced
if [ ! -d "$backupdir" ]; then
	mv "$targetdir" "$backupdir"
else
	rm -r "$targetdir"
fi
		
mkdir "$targetdir"

for file in "${backupdir}"*
do
	if mediainfo --output=XML "$file" | grep -q "<ID>4</ID>"; then
		ffmpeg -loglevel error -stats -i "$file" -map 0:a:"$language" -map 0:v:0 -c:a copy "${file/$backupdir/$targetdir}"
	else 
		cp "$file" "${file/$backupdir/$targetdir}"
	fi
done
