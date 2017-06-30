#!/bin/sh
echo "Download and Build Telegram theme RSM ..."
mkdir /tmp/RSM-telegram
cd /tmp/RSM-telegram
wget https://raw.githubusercontent.com/Jacobtey/RSM/master/extra/telegram/RSM/colors.tdesktop-theme
wget https://raw.githubusercontent.com/Jacobtey/RSM/master/extra/telegram/RSM/background.jpg
zip -r RSM-Telegram colors.tdesktop-theme background.jpg
mv RSM-Telegram.zip RSM.tdesktop-theme
xdg-open /tmp/RSM-telegram
