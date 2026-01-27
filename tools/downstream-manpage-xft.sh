#!/bin/bash
#Downstreaming xft-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/xterm/xft/xft.html

  cp ../xterm-on-invisible-island/manpage-xft.html ../stage/manpage-xft-text.html
# cp ../xterm-on-invisible-island/manpage-xft.html ../stage/manpage-xft-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-xft-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-xft-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-xft-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-xft-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-xft-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-xft-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-xft-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-xft-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-xft-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-xft-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-xft-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-xft-nav.html)

comment

cp ../docs/manpage-xft/index.html ../docs/manpage-xft/index-part-1.html
cp ../docs/manpage-xft/index.html ../docs/manpage-xft/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<p>downstreamed content<\/p>/=' ../docs/manpage-xft/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../docs/manpage-xft/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<p>end of downstreamed content<\/p>/=' ../docs/manpage-xft/index-part-2.html | (read ; sed -i "1,$REPLY d" ../docs/manpage-xft/index-part-2.html)

cat ../docs/manpage-xft/index-part-1.html ../stage/manpage-xft-text.html ../docs/manpage-xft/index-part-2.html > ../docs/manpage-xft/index.html

rm ../stage/manpage-xft-text.html
rm ../docs/manpage-xft/index-part-1.html ../docs/manpage-xft/index-part-2.html
