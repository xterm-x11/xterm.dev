#!/bin/bash
#Downstreaming xterm-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/xterm/manpage/xterm.html

  cp ../xterm-on-invisible-island/manpage-xterm.html ../stage/manpage-xterm-text.html
# cp ../xterm-on-invisible-island/manpage-xterm.html ../stage/manpage-xterm-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-xterm-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-xterm-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-xterm-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-xterm-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-xterm-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-xterm-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-xterm-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-xterm-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-xterm-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-xterm-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-xterm-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-xterm-nav.html)

comment

cp ../site/manpage-xterm/index.html ../site/manpage-xterm/index-part-1.html
cp ../site/manpage-xterm/index.html ../site/manpage-xterm/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../site/manpage-xterm/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../site/manpage-xterm/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../site/manpage-xterm/index-part-2.html | (read ; sed -i "1,$REPLY d" ../site/manpage-xterm/index-part-2.html)

cat ../site/manpage-xterm/index-part-1.html ../stage/manpage-xterm-text.html ../site/manpage-xterm/index-part-2.html > ../site/manpage-xterm/index.html

rm ../stage/manpage-xterm-text.html
rm ../site/manpage-xterm/index-part-1.html ../site/manpage-xterm/index-part-2.html
