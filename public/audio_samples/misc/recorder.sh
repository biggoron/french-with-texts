#!/bin/sh
# Script to save from microphone input on Linux console / terminal
# Please make sure Microphone is not muted in alsamixer or aumix
# 14.01.2013 - http://www.pc-freak.net
if [ $1 ]; then
arecord -D plughw:0,0 -f S16_LE -c1 -r22050 -t raw | lame -r -s 22.05 -m m -b 64 - $1
else
echo "Missing Argument 1: Enter file name as script argument (i.e. FILE.mp3)";
fi
