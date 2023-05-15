#!/usr/bin/env bash

if [ "$(playerctl status >>/dev/null 2>&1; echo $?)" == "1" ]
then
	echo "Media Unavailable"
	exit 0
fi

columns=64

zscroll -l $columns \
        --delay 0.1 \
        --match-command "playerctl metadata --format '{{ title }} | {{ artist }}'" \
        --update-check true "playerctl metadata --format '{{ title }} | {{ artist }}'" &

wait
