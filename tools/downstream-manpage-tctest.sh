#!/bin/bash
#Downstreaming tctest-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/ncurses/tctest/tctest.html

  cp ../xterm-on-invisible-island/manpage-tctest.html ../stage/manpage-tctest-text.html
# cp ../xterm-on-invisible-island/manpage-tctest.html ../stage/manpage-tctest-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-tctest-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-tctest-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-tctest-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-tctest-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-tctest-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-tctest-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-tctest-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-tctest-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-tctest-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-tctest-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-tctest-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-tctest-nav.html)

comment

cp ../docs/manpage-tctest/index.html ../docs/manpage-tctest/index-part-1.html
cp ../docs/manpage-tctest/index.html ../docs/manpage-tctest/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../docs/manpage-tctest/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../docs/manpage-tctest/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../docs/manpage-tctest/index-part-2.html | (read ; sed -i "1,$REPLY d" ../docs/manpage-tctest/index-part-2.html)

cat ../docs/manpage-tctest/index-part-1.html ../stage/manpage-tctest-text.html ../docs/manpage-tctest/index-part-2.html > ../docs/manpage-tctest/index.html

rm ../stage/manpage-tctest-text.html
rm ../docs/manpage-tctest/index-part-1.html ../docs/manpage-tctest/index-part-2.html
