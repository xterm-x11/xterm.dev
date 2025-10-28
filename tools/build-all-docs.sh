#!/bin/bash
# Prerequisites
#   Download the docs repo: https://github.com/xterm-x11/docs
#   Download the website repo https://github.com/xterm-x11/xterm-x11.github.io
#   The docs repo and the website repo must be at the same directory level so that the script can change directories correctly
#   Update the local mks docs.
#   Update the local material theme for mks docs.
#   The scipts require Bash.


git switch main
git pull
# git switch -c downstream

# run the script that wgets up-to-date XTerm content from invisible-island.net
# ./get-xterm-related-updates-from-invisible-island-net.sh

set -e

git checkout -b website_build_$(date -I)

# go one level up to the parent, /docs/ dir
# not needed for now
# cd ..

# not needed for now because stored in root dir
# cp docs/CNAME -t .

# run "the command to build mks docs (see mks docs docs)"

mkdocs build

# go back into the /toools/ dir

cd tools

# run the script for downstreaming the local copies of the invisible-island.net pages

# draft (WIP)
bash \
./downstream-changelog-luit.sh && \
./downstream-changelog-tack.sh && \
./downstream-changelog-tctest.sh && \
./downstream-changelog-vttest.sh && \
./downstream-changelog-xterm.sh && \
./downstream-manpage-koi8rterm.sh && \
./downstream-manpage-luit.sh && \
./downstream-manpage-resize.sh && \
./downstream-manpage-tack.sh && \
./downstream-manpage-tctest.sh && \
./downstream-manpage-uxterm.sh && \
./downstream-manpage-vttest.sh && \
./downstream-manpage-xcursor.sh && \
./downstream-manpage-xft.sh && \
./downstream-manpage-xterm.sh && \
# ./get-xterm-related-updates-from-invisible-island-net.sh

# temp list (WIP)
# ./downstream-manpage-koi8rterm.sh
# ./downstream-manpage-luit.sh
# ./downstream-manpage-resize.sh
# ./downstream-manpage-tack.sh
# ./downstream-manpage-tctest.sh
# ./downstream-manpage-uxterm.sh
# ./downstream-manpage-vttest.sh
# ./downstream-manpage-xcursor.sh
# ./downstream-manpage-xft.sh
# ./downstream-manpage-xterm.sh

# ./downstream-changelog-luit.sh
# ./downstream-changelog-tack.sh
# ./downstream-changelog-tctest.sh
# ./downstream-changelog-vttest.sh
# ./downstream-changelog-xterm.sh

cd ..

cp CNAME -t docs/

git add .

git commit -m "website build at $(date -Iminutes)"

git log -1 --oneline

git push -u origin website_build_$(date -I)

git switch main

git branch -D website_build_$(date -I)

echo "https://github.com/xterm-x11/xterm.dev/pull/new/website_build_$(date -I)"

# consider using the gh command-line tool:
# gh pr create --title "website_build_$(date -I)"
# Enter
# Enter
# Select line
# Copy line

<<comment

create a publish-docs.sh script file
add a comment line: prerequisite is both repos are locally cloned at the same directory level

go to the xterm-x11.github.io repo
create a timestamped publication branch for the xterm-x11.github.io repo
go back to this repo
pull main of this repo to get the changes from the last merged PR above
copy the docs/site dir into the xterm-x11.github.io dir
go to the xterm-x11.github.io repo
commit the changes to the xterm-x11.github.io repo with the commit message "Website update on YYYY-MM-DD"
create a PR for  the xterm-x11.github.io repo

comment

<<comment

./downstream-manpage-koi8rterm.sh && \
./downstream-manpage-luit.sh && \
./downstream-manpage-resize.sh && \
./downstream-manpage-uxterm.sh && \
./downstream-manpage-vttest.sh && \
./downstream-manpage-xterm.sh && \
./downstream-release-notes.sh

comment

<<comment

cd ../../xterm-x11.github.io
git switch main
git pull
git switch -c update
cd -
cp -r ../site/* ../../xterm-x11.github.io
cd ../../xterm-x11.github.io
git add .
git commit -m "website update"
git push -u origin update

comment

# cd ..
# mkdocs serve
# firefox http://127.0.0.1:8000/

