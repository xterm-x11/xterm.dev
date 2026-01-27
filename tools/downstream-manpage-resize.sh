#!/bin/bash
#Downstreaming resize-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/resize/manpage/resize.html

  cp ../xterm-on-invisible-island/manpage-resize.html ../stage/manpage-resize-text.html
# cp ../xterm-on-invisible-island/manpage-resize.html ../stage/manpage-resize-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-resize-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-resize-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-resize-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-resize-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-resize-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-resize-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-resize-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-resize-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-resize-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-resize-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-resize-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-resize-nav.html)

comment

cp ../docs/manpage-resize/index.html ../docs/manpage-resize/index-part-1.html
cp ../docs/manpage-resize/index.html ../docs/manpage-resize/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<p>downstreamed content<\/p>/=' ../docs/manpage-resize/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../docs/manpage-resize/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<p>end of downstreamed content<\/p>/=' ../docs/manpage-resize/index-part-2.html | (read ; sed -i "1,$REPLY d" ../docs/manpage-resize/index-part-2.html)

cat ../docs/manpage-resize/index-part-1.html ../stage/manpage-resize-text.html ../docs/manpage-resize/index-part-2.html > ../docs/manpage-resize/index.html

rm ../stage/manpage-resize-text.html
rm ../docs/manpage-resize/index-part-1.html ../docs/manpage-resize/index-part-2.html
