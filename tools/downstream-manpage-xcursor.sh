#!/bin/bash
#Downstreaming xcursor-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/xterm/xcursor/xcursor.html

  cp ../xterm-on-invisible-island/manpage-xcursor.html ../stage/manpage-xcursor-text.html
# cp ../xterm-on-invisible-island/manpage-xcursor.html ../stage/manpage-xcursor-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-xcursor-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-xcursor-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-xcursor-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-xcursor-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-xcursor-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-xcursor-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-xcursor-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-xcursor-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-xcursor-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-xcursor-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-xcursor-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-xcursor-nav.html)

comment

cp ../docs/manpage-xcursor/index.html ../docs/manpage-xcursor/index-part-1.html
cp ../docs/manpage-xcursor/index.html ../docs/manpage-xcursor/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../docs/manpage-xcursor/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../docs/manpage-xcursor/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../docs/manpage-xcursor/index-part-2.html | (read ; sed -i "1,$REPLY d" ../docs/manpage-xcursor/index-part-2.html)

cat ../docs/manpage-xcursor/index-part-1.html ../stage/manpage-xcursor-text.html ../docs/manpage-xcursor/index-part-2.html > ../docs/manpage-xcursor/index.html

rm ../stage/manpage-xcursor-text.html
rm ../docs/manpage-xcursor/index-part-1.html ../docs/manpage-xcursor/index-part-2.html
