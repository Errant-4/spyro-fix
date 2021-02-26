# spyro-fix

Even if you get the pre-rendered cutscenes to play with custom proton like the amazing Proton-GE, they will probably play in randomly selected languages. This may be caused by the video files for the game containing a "Default" flag on every single audio track

A functional -if crude- way to solve this is to create copies of the cutscene files with only the desired language's audio track, but since there are 30 video files to modify (mixed in with 40+ other non-speaking videos you have to dig through)  and you might have to do it again later if you reinstall or Steam "repairs" the files, this script will do it for you automatically

1. Confirm that you have the required packages installed: ffmpeg, mediainfo
2. Download spyro-fix.sh
3. Optional: If your game is not installed in the assumed Steam location you will have to edit the paths in the script (both targetdir and backupdir)
4. Optional: choose a different language by editing the "language" number in the script (to get the number for another language, open Movies/C_Spyro01_Intro.mp4 with any media player and find the audio track you want. The index number you have to put in the script will be one lower than the the audiotrack's number)
5. Make the file executable with     chmod +x <path>/spyro-fix.sh
6. Run spyro-fix.sh (it will take 10-20 minutes to create the new files)


If you want to restore everything to the original conditions afterwards without any downloading required, simply delete the game's "Movies" folder and rename "Movies_backup" to "Movies"
