#!/bin/bash
#Downstreaming xterm-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/xterm/manpage/koi8rxterm.html

  cp ../xterm-on-invisible-island/manpage-koi8rxterm.html ../stage/manpage-koi8rxterm-text.html
# cp ../xterm-on-invisible-island/manpage-koi8rxterm.html ../stage/manpage-koi8rxterm-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-koi8rxterm-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-koi8rxterm-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-koi8rxterm-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-koi8rxterm-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-koi8rxterm-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-koi8rxterm-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-koi8rxterm-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-koi8rxterm-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-koi8rxterm-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-koi8rxterm-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-koi8rxterm-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-koi8rxterm-nav.html)

comment

cp ../site/manpage-koi8rxterm/index.html ../site/manpage-koi8rxterm/index-part-1.html
cp ../site/manpage-koi8rxterm/index.html ../site/manpage-koi8rxterm/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../site/manpage-koi8rxterm/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../site/manpage-koi8rxterm/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../site/manpage-koi8rxterm/index-part-2.html | (read ; sed -i "1,$REPLY d" ../site/manpage-koi8rxterm/index-part-2.html)

cat ../site/manpage-koi8rxterm/index-part-1.html ../stage/manpage-koi8rxterm-text.html ../site/manpage-koi8rxterm/index-part-2.html > ../site/manpage-koi8rxterm/index.html

rm ../stage/manpage-koi8rxterm-text.html
rm ../site/manpage-koi8rxterm/index-part-1.html ../site/manpage-koi8rxterm/index-part-2.html
