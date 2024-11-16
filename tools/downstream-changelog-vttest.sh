#!/bin/bash
#Downstreaming xterm-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/vttest/CHANGES.html

cp ../xterm-on-invisible-island/vttest-changes.html ../stage/changelog-vttest-nav.html
cp ../xterm-on-invisible-island/vttest-changes.html ../stage/changelog-vttest-content.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/changelog-vttest-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/changelog-vttest-nav.html)

# remove the line `<li class="nav-top"><a href="vttest-changes.html">(top)</a></li>` from ../stage/changelog-vttest-nav.html
sed -i /'nav-top'/d  ../stage/changelog-vttest-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/changelog-vttest-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/changelog-vttest-nav.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/changelog-vttest-content.html | (read ; sed -i "1,$REPLY d" ../stage/changelog-vttest-content.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/body>/=' ../stage/changelog-vttest-content.html | (read ; sed -i "$REPLY,$ d" ../stage/changelog-vttest-content.html)

# concatenate both file excerpts
cat ../stage/changelog-vttest-nav.html ../stage/changelog-vttest-content.html > ../stage/downstreamed-complete-changelog-vttest-page.html

# delete both file excerpts
rm ../stage/changelog-vttest-nav.html ../stage/changelog-vttest-content.html

cp ../site/changelog-vttest/index.html ../site/changelog-vttest/index-part-1.html
cp ../site/changelog-vttest/index.html ../site/changelog-vttest/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../site/changelog-vttest/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../site/changelog-vttest/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../site/changelog-vttest/index-part-2.html | (read ; sed -i "1,$REPLY d" ../site/changelog-vttest/index-part-2.html)

cat ../site/changelog-vttest/index-part-1.html ../stage/downstreamed-complete-changelog-vttest-page.html ../site/changelog-vttest/index-part-2.html > ../site/changelog-vttest/index.html

rm ../stage/downstreamed-complete-changelog-vttest-page.html
rm ../site/changelog-vttest/index-part-1.html ../site/changelog-vttest/index-part-2.html
