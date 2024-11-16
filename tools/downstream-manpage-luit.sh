#!/bin/bash
#Downstreaming luit-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/luit/manpage/luit.html

  cp ../xterm-on-invisible-island/manpage-luit.html ../stage/manpage-luit-text.html
# cp ../xterm-on-invisible-island/manpage-luit.html ../stage/manpage-luit-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-luit-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-luit-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-luit-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-luit-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-luit-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-luit-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-luit-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-luit-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-luit-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-luit-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-luit-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-luit-nav.html)

comment

cp ../docs/manpage-luit/index.html ../docs/manpage-luit/index-part-1.html
cp ../docs/manpage-luit/index.html ../docs/manpage-luit/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../docs/manpage-luit/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../docs/manpage-luit/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../docs/manpage-luit/index-part-2.html | (read ; sed -i "1,$REPLY d" ../docs/manpage-luit/index-part-2.html)

cat ../docs/manpage-luit/index-part-1.html ../stage/manpage-luit-text.html ../docs/manpage-luit/index-part-2.html > ../docs/manpage-luit/index.html

rm ../stage/manpage-luit-text.html
rm ../docs/manpage-luit/index-part-1.html ../docs/manpage-luit/index-part-2.html
