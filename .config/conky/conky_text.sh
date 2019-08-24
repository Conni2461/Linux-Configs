#!/bin/sh

echo '${color1}${font Noto Sans Mono:size=16}Date and Time'
echo '${font}${color}${time %B %d %Y}'
echo '${font}${time %A}'
echo '${font Noto Sans Mono:size=30}${color}${time %I:%M%p}'
echo '${color1}${font}NEW YORK      ${color}${tztime America/New_York %m/%d/%Y %I:%M%p}'
echo '${color1}${font}LOS ANGELES   ${color}${tztime America/Los_Angeles %m/%d/%Y %I:%M%p}'
echo '${color1}${font}TOKYO         ${color}${tztime Asia/Tokyo %m/%d/%Y %I:%M%p}'

if [ "$(calcurse -a)" != "" ]; then
	echo
	echo '${color1}${font}APPOINTMENTS'
	echo '${color}${exec calcurse -a | sed -n '1!p'}'
fi

if [ "$(cat /tmp/twitch-streams.txt)" != "" ]; then
	echo
	echo '${color1}${font}TWITCH'
	echo '${color}${exec cat /tmp/twitch-streams.txt}'
fi

echo
echo '${color1}${font}UPTIME'
echo '${color}$uptime'