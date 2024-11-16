#!/bin/bash
#Downstreaming xterm-related pages from Thomas Dickey's https://invisible-island.net/

set -e

# the original file is https://invisible-island.net/ncurses/tctest/CHANGES.html

cp ../xterm-on-invisible-island/tctest-changes.html ../stage/changelog-tctest-nav.html
cp ../xterm-on-invisible-island/tctest-changes.html ../stage/changelog-tctest-content.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file excluding the line of this HTML element
sed -n '/<div class="nav">/=' ../stage/changelog-tctest-nav.html | (read ; LINEBEFORE=$(( $REPLY - 1 )); sed -i "1,$LINEBEFORE d" ../stage/changelog-tctest-nav.html)

# remove the line `<li class="nav-top"><a href="tctest-changes.html">(top)</a></li>` from ../stage/changelog-tctest-nav.html
sed -i /'nav-top'/d  ../stage/changelog-tctest-nav.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file excluding the line of this HTML element
sed -n '/<\/div>/=' ../stage/changelog-tctest-nav.html | (read ; LINEAFTER=$(( $REPLY + 1 )); sed -i "$LINEAFTER,$ d" ../stage/changelog-tctest-nav.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/<\/div>/=' ../stage/changelog-tctest-content.html | (read ; sed -i "1,$REPLY d" ../stage/changelog-tctest-content.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/<\/body>/=' ../stage/changelog-tctest-content.html | (read ; sed -i "$REPLY,$ d" ../stage/changelog-tctest-content.html)

# concatenate both file excerpts
cat ../stage/changelog-tctest-nav.html ../stage/changelog-tctest-content.html > ../stage/downstreamed-complete-changelog-tctest-page.html

# delete both file excerpts
rm ../stage/changelog-tctest-nav.html ../stage/changelog-tctest-content.html

cp ../docs/changelog-tctest/index.html ../docs/changelog-tctest/index-part-1.html
cp ../docs/changelog-tctest/index.html ../docs/changelog-tctest/index-part-2.html

# get the line number for this HTML element, pipe it as a variable with read, and delete the last lines of the file including the line of this HTML element
sed -n '/downstreamed content/=' ../docs/changelog-tctest/index-part-1.html | (read ; sed -i "$REPLY,$ d" ../docs/changelog-tctest/index-part-1.html)

# get the line number for this HTML element, pipe it as a variable with read, and delete the first lines of the file including the line of this HTML element
sed -n '/end of downstreamed content/=' ../docs/changelog-tctest/index-part-2.html | (read ; sed -i "1,$REPLY d" ../docs/changelog-tctest/index-part-2.html)

cat ../docs/changelog-tctest/index-part-1.html ../stage/downstreamed-complete-changelog-tctest-page.html ../docs/changelog-tctest/index-part-2.html > ../docs/changelog-tctest/index.html

rm ../stage/downstreamed-complete-changelog-tctest-page.html
rm ../docs/changelog-tctest/index-part-1.html ../docs/changelog-tctest/index-part-2.html
