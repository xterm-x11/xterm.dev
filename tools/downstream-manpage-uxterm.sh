#!/bin/bash
#Downstreaming xterm-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is ttps://invisible-island.net/xterm/manpage/uxterm.html

  cp ../xterm-on-invisible-island/manpage-uxterm.html ../stage/manpage-uxterm-text.html
# cp ../xterm-on-invisible-island/manpage-uxterm.html ../stage/manpage-uxterm-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-uxterm-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-uxterm-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-uxterm-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-uxterm-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-uxterm-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-uxterm-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-uxterm-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-uxterm-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-uxterm-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-uxterm-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-uxterm-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-uxterm-nav.html)

comment

cp ../site/manpage-uxterm/index.html ../site/manpage-uxterm/index-part-1.html
cp ../site/manpage-uxterm/index.html ../site/manpage-uxterm/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../site/manpage-uxterm/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../site/manpage-uxterm/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../site/manpage-uxterm/index-part-2.html | (read ; sed -i "1,$REPLY d" ../site/manpage-uxterm/index-part-2.html)

cat ../site/manpage-uxterm/index-part-1.html ../stage/manpage-uxterm-text.html ../site/manpage-uxterm/index-part-2.html > ../site/manpage-uxterm/index.html

rm ../stage/manpage-uxterm-text.html
rm ../site/manpage-uxterm/index-part-1.html ../site/manpage-uxterm/index-part-2.html
