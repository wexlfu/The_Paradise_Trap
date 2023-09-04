#!/bin/bash
set -ex

cd "$(dirname "$0")"

wesnoth --screenshot ./worldmap.cfg ../images/worldmap.png

commandline=""
font="$(wesnoth --data-path)/fonts/OldaniaADFStd-Regular.otf"

label() {
	x=$1
	y=$2
	text="$3"
	scale=${4:-1}
	scalei="$(echo "$scale * 48" | bc | cut -d. -f1)"
	len="$(echo "$text" | wc -c)"

	commandline="$commandline -pointsize \"$scalei\" -font \"$font\" -fill white -gravity NorthWest -draw \"text $((x - (scalei * len) / 6)),$((y - $scalei)) \\\"$text\\\"\""
}

label 3510 1040 "Elensefar" 1.5
label 3732 1338 "Halstead"
label 3680 1616 "Aldril"
label 4000 1190 "Carcyn"
label 3303 2304 "Blackwater Port"
label 3024 2037 "Isle of Alduin"
label 2445 1134 "The Three Sisters"

label 1606 1317 "Ialwas"

label 3357 441 "Glamdrol"
label 3837 282 "Rumyr"

label 5031 1866 "Dan Tonk" 1.5
label 5523 2349 "Weldyn" 1.5
label 5349 1722 "Tath"
label 4875 2844 "Fort Tahn"

label 4815 1362 "Gryphon Mountain"
label 5640 1086 "Swamp of Dread" 2
label 4380 213 "Lake Vrug" 2

label 3960 760 "Wesmere Forest" 2
label 3774 2670 "Aethenwood"

label 423 1719 "Paradise" 3
label 4344 1911 "Wesnoth" 3

eval "convert $commandline ../images/worldmap.png ../images/worldmap.png"
