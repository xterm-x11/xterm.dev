#!/bin/bash
#Downstreaming tack-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/ncurses/tack/tack.html

  cp ../xterm-on-invisible-island/manpage-tack.html ../stage/manpage-tack-text.html
# cp ../xterm-on-invisible-island/manpage-tack.html ../stage/manpage-tack-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-tack-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-tack-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-tack-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-tack-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-tack-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-tack-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-tack-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-tack-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-tack-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-tack-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-tack-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-tack-nav.html)

comment

cp ../site/manpage-tack/index.html ../site/manpage-tack/index-part-1.html
cp ../site/manpage-tack/index.html ../site/manpage-tack/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../site/manpage-tack/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../site/manpage-tack/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../site/manpage-tack/index-part-2.html | (read ; sed -i "1,$REPLY d" ../site/manpage-tack/index-part-2.html)

cat ../site/manpage-tack/index-part-1.html ../stage/manpage-tack-text.html ../site/manpage-tack/index-part-2.html > ../site/manpage-tack/index.html

rm ../stage/manpage-tack-text.html
rm ../site/manpage-tack/index-part-1.html ../site/manpage-tack/index-part-2.html
