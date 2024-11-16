#!/bin/bash
#Downstreaming vttest-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/vttest/manpage/vttest.html

  cp ../xterm-on-invisible-island/manpage-vttest.html ../stage/manpage-vttest-text.html
# cp ../xterm-on-invisible-island/manpage-vttest.html ../stage/manpage-vttest-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<h2><a name="h2-NAME" id="h2-NAME">NAME<\/a><\/h2>/=' ../stage/manpage-vttest-text.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-vttest-text.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-vttest-text.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-vttest-text.html)

<<comment

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-vttest-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/manpage-vttest-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/manpage-vttest-nav.html | (read ; sed -i "1,$REPLY d" ../stage/manpage-vttest-nav.html)

# AND

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-vttest-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/manpage-vttest-nav.html)

# OR

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/manpage-vttest-nav.html | (read ; sed -i "$REPLY,$ d" ../stage/manpage-vttest-nav.html)

comment

cp ../site/manpage-vttest/index.html ../site/manpage-vttest/index-part-1.html
cp ../site/manpage-vttest/index.html ../site/manpage-vttest/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../site/manpage-vttest/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../site/manpage-vttest/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../site/manpage-vttest/index-part-2.html | (read ; sed -i "1,$REPLY d" ../site/manpage-vttest/index-part-2.html)

cat ../site/manpage-vttest/index-part-1.html ../stage/manpage-vttest-text.html ../site/manpage-vttest/index-part-2.html > ../site/manpage-vttest/index.html

rm ../stage/manpage-vttest-text.html
rm ../site/manpage-vttest/index-part-1.html ../site/manpage-vttest/index-part-2.html
