#!/bin/bash
#Downstreaming xterm-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/ncurses/tack/CHANGES.html

cp ../xterm-on-invisible-island/tack-changes.html ../stage/changelog-tack-nav.html
cp ../xterm-on-invisible-island/tack-changes.html ../stage/changelog-tack-content.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/changelog-tack-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/changelog-tack-nav.html)

# remove the line `<li class="nav-top"><a href="tack-changes.html">(top)</a></li>` from ../stage/changelog-tack-nav.html
sed -i /'nav-top'/d  ../stage/changelog-tack-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/changelog-tack-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/changelog-tack-nav.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<pre>/=' ../stage/changelog-tack-content.html | (read ; sed -i "1,$REPLY d" ../stage/changelog-tack-content.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/pre>/=' ../stage/changelog-tack-content.html | (read ; sed -i "$REPLY,$ d" ../stage/changelog-tack-content.html)

# concatenate both file excerpts
cat ../stage/changelog-tack-nav.html ../stage/changelog-tack-content.html > ../stage/downstreamed-complete-changelog-tack-page.html

# delete both file excerpts
rm ../stage/changelog-tack-nav.html ../stage/changelog-tack-content.html

cp ../docs/changelog-tack/index.html ../docs/changelog-tack/index-part-1.html
cp ../docs/changelog-tack/index.html ../docs/changelog-tack/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../docs/changelog-tack/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../docs/changelog-tack/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../docs/changelog-tack/index-part-2.html | (read ; sed -i "1,$REPLY d" ../docs/changelog-tack/index-part-2.html)

cat ../docs/changelog-tack/index-part-1.html ../stage/downstreamed-complete-changelog-tack-page.html ../docs/changelog-tack/index-part-2.html > ../docs/changelog-tack/index.html

rm ../stage/downstreamed-complete-changelog-tack-page.html
rm ../docs/changelog-tack/index-part-1.html ../docs/changelog-tack/index-part-2.html
