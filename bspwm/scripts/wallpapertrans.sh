#!/bin/bash
# Animated wallpaper changer
feh --bg-fill ~/.cache/wallpaper/old.jpg


DISPLAY=:0
WALLPAPERS="$HOME/Pictures/wallpapers/"
#wallpappath=( `"find "$WALLPAPERS" | shuf -n 1"` )
wallpappath=$(find "$WALLPAPERS" | shuf -n 1)
echo "$wallpappath" > "$HOME/.cache/current.bg"

# polybar bg theme
# forground experiment is bad
#if [[ $(bgthemecheck.sh) == "dark" ]]; then
#    sed -i 's/^\*.bgcolor*$/\*.bgcolor: #C7242931/g' "$HOME"/.Xresources
#elif [[ $(bgthemecheck.sh) == "light" ]]; then
#    sed -i 's/^\*.bgcolor*$/\*.bgcolor: #C7FFFFFF/g' "$HOME"/.Xresources
#else
#    printf "An error had occured during apply theme to polybar"
#fi

DELAY=0.01
QUALITY=0.3
RESIZE=30%

echo $#

if [ $# -ne 1 ]; then
	convert ~/.cache/wallpaper/old.jpg -resize $RESIZE -fill black -blur 10% -fill black -colorize 10% -quality $QUALITY /tmp/transition1.jpg
	convert ~/.cache/wallpaper/old.jpg -resize $RESIZE -fill black -blur 20% -fill black -colorize 20% -quality $QUALITY /tmp/transition2.jpg
	convert ~/.cache/wallpaper/old.jpg -resize $RESIZE -fill black -blur 35% -fill black -colorize 35% -quality $QUALITY /tmp/transition3.jpg
	convert ~/.cache/wallpaper/old.jpg -resize $RESIZE -fill black -blur 50% -fill black -colorize 50% -quality $QUALITY /tmp/transition4.jpg
	convert ~/.cache/wallpaper/old.jpg -resize $RESIZE -fill black -blur 75% -fill black -colorize 75% -quality $QUALITY /tmp/transition5.jpg
	convert ~/.cache/wallpaper/old.jpg -resize $RESIZE -fill black -blur 100% -fill black -colorize 100% -quality $QUALITY /tmp/transition6.jpg

	convert "$wallpappath" -resize $RESIZE -fill black -blur 75% -fill black -colorize 75% -quality $QUALITY /tmp/transition7.jpg
	convert "$wallpappath" -resize $RESIZE -fill black -blur 50% -fill black -colorize 50% -quality $QUALITY /tmp/transition8.jpg
	convert "$wallpappath" -resize $RESIZE -fill black -blur 35% -fill black -colorize 35% -quality $QUALITY /tmp/transition9.jpg
	convert "$wallpappath" -resize $RESIZE -fill black -blur 20% -fill black -colorize 20% -quality $QUALITY /tmp/transition10.jpg
	convert "$wallpappath" -resize $RESIZE -fill black -blur 10% -fill black -colorize 10% -quality $QUALITY /tmp/transition11.jpg

	feh --bg-fill /tmp/transition1.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition2.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition3.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition4.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition5.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition6.jpg
	sleep $DELAY

	feh --bg-fill /tmp/transition7.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition8.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition9.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition10.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition11.jpg
	sleep $DELAY

	rm /tmp/transition*
fi

feh --bg-fill "$wallpappath"

cp "$wallpappath" ~/.cache/wallpaper/old.jpg

