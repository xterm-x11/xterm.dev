#!/bin/bash
#Downstreaming xterm-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/luit/luit.log.html

cp ../xterm-on-invisible-island/luit.log.html ../stage/changelog-luit-nav.html
cp ../xterm-on-invisible-island/luit.log.html ../stage/changelog-luit-content.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/changelog-luit-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/changelog-luit-nav.html)

# remove the line `<li class="nav-top"><a href="luit.log.html">(top)</a></li>` from ../stage/changelog-luit-nav.html
sed -i /'nav-top'/d  ../stage/changelog-luit-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/changelog-luit-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/changelog-luit-nav.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/changelog-luit-content.html | (read ; sed -i "1,$REPLY d" ../stage/changelog-luit-content.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/body>/=' ../stage/changelog-luit-content.html | (read ; sed -i "$REPLY,$ d" ../stage/changelog-luit-content.html)

# concatenate both file excerpts
cat ../stage/changelog-luit-nav.html ../stage/changelog-luit-content.html > ../stage/downstreamed-complete-changelog-luit-page.html

# delete both file excerpts
rm ../stage/changelog-luit-nav.html ../stage/changelog-luit-content.html

cp ../site/changelog-luit/index.html ../site/changelog-luit/index-part-1.html
cp ../site/changelog-luit/index.html ../site/changelog-luit/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../site/changelog-luit/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../site/changelog-luit/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../site/changelog-luit/index-part-2.html | (read ; sed -i "1,$REPLY d" ../site/changelog-luit/index-part-2.html)

cat ../site/changelog-luit/index-part-1.html ../stage/downstreamed-complete-changelog-luit-page.html ../site/changelog-luit/index-part-2.html > ../site/changelog-luit/index.html

rm ../stage/downstreamed-complete-changelog-luit-page.html
rm ../site/changelog-luit/index-part-1.html ../site/changelog-luit/index-part-2.html
