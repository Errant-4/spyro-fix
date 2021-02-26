# spyro-fix

The Spyro Reignited trilogy runs well on Proton, except for the part where the pre-rendered cutscenes are completely skipped.
And when you get them to play with custom proton (like the amazing Proton-GE), they will probably play in randomly selected languages. I thought this may be caused by the video files for the game containing a "Default" flag on every single audio track, but even when I re-encoded them with a single default track the game picked them at random. As such, my workaround for now is to create copies of the cutscene files with only the desired language's audio track. But since there are 30 video files to modify (mixed in with 40+ other non-speaking videos you have to sort through) and I might have to do it again later if I reinstall or Steam "repairs" the files, this script will make them for you automatically

#Instructions
 1. Confirm that you have the required packages installed: ffmpeg, mediainfo
 2. Download spyro-fix.sh
 3. If your game is not installed in the default Steam location you will have to edit the targetdir and backupdir paths in the script
 4. Optional: You can switch to any of the other included languages by editing the "language" number in the script (to get the number for another language, open Movies/C_Spyro01_Intro.mp4 with any media player and find the audio track you want. The index number you have to put in the script will be one lower than the the audiotrack's number). Or if someone wants to take the time to identify them all I will include a comment in the script with the list
 5. Make the file executable with chmod +x ./spyro-fix.sh
 6. Run spyro-fix.sh (it should take 10-20 minutes to create the new files)


If you want to restore everything to the original conditions afterwards without any downloading required, simply delete the modified "Movies" folder and rename "Movies_backup" to "Movies"
