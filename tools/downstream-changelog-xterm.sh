#!/bin/bash
#Downstreaming xterm-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/xterm/xterm.log.html

cp ../xterm-on-invisible-island/xterm.log.html ../stage/changelog-xterm-nav.html
cp ../xterm-on-invisible-island/xterm.log.html ../stage/changelog-xterm-content.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/changelog-xterm-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/changelog-xterm-nav.html)

# remove the line `<li class="nav-top"><a href="xterm.log.html">(top)</a></li>` from ../stage/changelog-xterm-nav.html
sed -i /'nav-top'/d  ../stage/changelog-xterm-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/changelog-xterm-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/changelog-xterm-nav.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/changelog-xterm-content.html | (read ; sed -i "1,$REPLY d" ../stage/changelog-xterm-content.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/body>/=' ../stage/changelog-xterm-content.html | (read ; sed -i "$REPLY,$ d" ../stage/changelog-xterm-content.html)

# concatenate both file excerpts
cat ../stage/changelog-xterm-nav.html ../stage/changelog-xterm-content.html > ../stage/downstreamed-complete-changelog-xterm-page.html

# delete both file excerpts
rm ../stage/changelog-xterm-nav.html ../stage/changelog-xterm-content.html

cp ../site/changelog-xterm/index.html ../site/changelog-xterm/index-part-1.html
cp ../site/changelog-xterm/index.html ../site/changelog-xterm/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../site/changelog-xterm/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../site/changelog-xterm/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../site/changelog-xterm/index-part-2.html | (read ; sed -i "1,$REPLY d" ../site/changelog-xterm/index-part-2.html)

cat ../site/changelog-xterm/index-part-1.html ../stage/downstreamed-complete-changelog-xterm-page.html ../site/changelog-xterm/index-part-2.html > ../site/changelog-xterm/index.html

rm ../stage/downstreamed-complete-changelog-xterm-page.html
rm ../site/changelog-xterm/index-part-1.html ../site/changelog-xterm/index-part-2.html
