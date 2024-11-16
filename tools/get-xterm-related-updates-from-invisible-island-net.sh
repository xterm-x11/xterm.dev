#!/bin/bash
#Downstreaming xterm-related pages from Thomas Dickey's https://invisible-island.net/

set -e

git checkout -b downstreaming_$(date -I)

cd ../xterm-on-invisible-island

rm *

# Recurrent downstreaming to fetch updates from https://invisible-island.net/:
# (This list is for the pages that are to be downloaded regularly to fetch updates.)
wget https://invisible-island.net/xterm/manpage/xterm.html
mv xterm.html manpage-xterm.html
wget https://invisible-island.net/xterm/manpage/uxterm.html
mv uxterm.html manpage-uxterm.html
wget https://invisible-island.net/xterm/manpage/koi8rxterm.html
mv koi8rxterm.html manpage-koi8rxterm.html
wget https://invisible-island.net/xterm/ctlseqs/ctlseqs.html
mv ctlseqs.html ctlseqs-guide.html
wget https://invisible-island.net/xterm/ctlseqs/ctlseqs-contents.html
mv ctlseqs-contents.html ctlseqs-list.html
#
wget https://invisible-island.net/xterm/xterm.log.html
#
wget https://invisible-island.net/lynx/lynx.html
wget https://invisible-island.net/lynx/lynx-develop.html
wget https://lynx.invisible-island.net/current/index.html # check for more links
wget https://lynx.invisible-island.net/current/CHANGES.html
mv CHANGES.html lynx-changes.html
wget https://lynx.invisible-island.net/current/CHANGES
mv CHANGES lynx-changes
wget https://invisible-island.net/lynx/lynx-autoconf.html
wget https://lynx.invisible-island.net/lynx_help/Lynx_users_guide.html # check for more links
wget https://lynx.invisible-island.net/lynx_help/lynx_help_main.html # check for more links
wget https://invisible-island.net/lynx/lynx-ncurses.html
wget https://invisible-island.net/lynx/lynx-security.html
#
wget https://invisible-island.net/vttest/CHANGES.html
mv CHANGES.html vttest-changes.html
wget https://invisible-island.net/vttest/CHANGES
mv CHANGES vttest-changes
wget https://invisible-island.net/vttest/manpage/vttest.html
mv vttest.html manpage-vttest.html
wget https://invisible-island.net/vttest/manpage/vttest.txt
wget https://invisible-island.net/vttest/manpage/vttest.pdf
wget https://invisible-island.net/vttest/manpage/vttest.ps
wget https://invisible-island.net/vttest/vttest.html
#
wget https://invisible-island.net/ncurses/tack/CHANGES.html
mv CHANGES.html tack-changes.html
wget https://invisible-island.net/ncurses/tack/CHANGES
mv CHANGES tack-changes
wget https://invisible-island.net/ncurses/tack/tack.html
mv tack.html manpage-tack.html
wget https://invisible-island.net/ncurses/tack/tack.txt
wget https://invisible-island.net/ncurses/tack/tack.pdf
wget https://invisible-island.net/ncurses/tack/tack.ps
wget https://invisible-island.net/ncurses/tack.html
#
wget https://invisible-island.net/ncurses/tctest/CHANGES.html
mv CHANGES.html tctest-changes.html
wget https://invisible-island.net/ncurses/tctest/CHANGES
mv CHANGES tctest-changes
wget https://invisible-island.net/ncurses/tctest/tctest.html
mv tctest.html manpage-tctest.html
wget https://invisible-island.net/ncurses/tctest/tctest.txt
wget https://invisible-island.net/ncurses/tctest/tctest.pdf
wget https://invisible-island.net/ncurses/tctest/tctest.ps
wget https://invisible-island.net/ncurses/tctest.html
#
wget https://invisible-island.net/ncurses/ncurses-examples.html
#
wget https://invisible-island.net/xterm/xft/xft.html
mv xft.html manpage-xft.html
#
wget https://invisible-island.net/xterm/xcursor/xcursor.html
mv xcursor.html manpage-xcursor.html
#
wget https://invisible-island.net/luit/manpage/luit.html # check all links
mv luit.html manpage-luit.html
wget https://invisible-island.net/luit/manpage/luit.txt
wget https://invisible-island.net/luit/manpage/luit.pdf
wget https://invisible-island.net/luit/manpage/luit.ps
wget https://invisible-island.net/luit/luit.html
wget https://invisible-island.net/luit/luit.log.html
#
wget https://invisible-island.net/xterm/manpage/resize.html
mv resize.html manpage-resize.html
wget https://invisible-island.net/xterm/manpage/resize.txt
wget https://invisible-island.net/xterm/manpage/resize.ps
wget https://invisible-island.net/xterm/manpage/resize.pdf
#
wget https://gitlab.freedesktop.org/xorg/lib/libxt # Git repo, not the page
#
wget https://invisible-island.net/datafiles/release/xterm.tar.gz
wget https://invisible-island.net/datafiles/release/vttest.tar.gz
wget https://invisible-island.net/datafiles/release/tack.tar.gz
wget https://invisible-island.net/datafiles/current/tack.tar.gz
wget https://invisible-island.net/datafiles/release/tctest.tar.gz
wget https://invisible-island.net/datafiles/release/luit.tar.gz
#
# wget https://invisible-island.net/archives/xterm/ # --level=NUMBER ? Add the `-r` option to wget and test.
# wget https://invisible-island.net/archives/vttest/ # --level=NUMBER ? Add the `-r` option to wget and test.
# wget tack? ^
# wget https://www.invisible-island.net/archives/tctest/ # --level=NUMBER ? Add the `-r` option to wget and test.
# wget https://invisible-island.net/archives/luit/ # --level=NUMBER ? Add the `-r` option to wget and test.
#
# See more links to manpages under https://invisible-island.net/xterm/xterm.faq.html#more_info
#
# Copy the information to be published on xterm.org from the xterm-related pages on https://invisible-island.net/ that are not expected to be updated:
# (This list is for the pages that are to be downloaded only once (or so).)
wget http://www.bitsavers.org/pdf/dec/vax/vaxstation100/AA-N660A-TE_VAXstation_100_Users_Guide_Jun84.pdf
# wget http://www.bitsavers.org/pdf/dec/standards/EL-SM070-00_DEC_STD_070_Video_Systems_Reference_Manual_Dec91.pdf # already downloaded, commenting out to avoid lsf warning messages pointing to https://git-lfs.com/ during script runs
wget http://www.bitsavers.org/pdf/dec/dtj/dtj_v02-03_1990.pdf
#
wget https://invisible-island.net/xterm/xterm.html
wget https://invisible-island.net/xterm/xterm.faq.html
wget https://invisible-island.net/xterm/xterm.icon.html
#
wget https://invisible-island.net/scripts/readme.html
##
wget https://invisible-island.net/datafiles/release/buildscripts.tar.gz
wget https://invisible-island.net/scripts/buildscripts/CHANGES.html
mv CHANGES.html buildscripts-changes.html
wget https://invisible-island.net/scripts/buildscripts/CHANGES
mv CHANGES buildscripts-changes
##
wget https://invisible-island.net/datafiles/release/misc-scripts.tar.gz
wget https://invisible-island.net/scripts/misc-scripts/CHANGES.html
mv CHANGES.html misc-scripts-changes.html
wget https://invisible-island.net/scripts/misc-scripts/CHANGES
mv CHANGES misc-scripts-changes
##
wget https://invisible-island.net/datafiles/release/github-scripts.tar.gz
wget https://invisible-island.net/scripts/github-scripts/CHANGES.html
mv CHANGES.html github-scripts-changes.html
wget https://invisible-island.net/scripts/github-scripts/CHANGES
mv CHANGES github-scripts-changes
##
wget https://invisible-island.net/datafiles/release/mapsym-scripts.tar.gz
wget https://invisible-island.net/scripts/mapsym-scripts/CHANGES.html
mv CHANGES.html mapsym-scripts-changes.html
wget https://invisible-island.net/scripts/mapsym-scripts/CHANGES
mv CHANGES mapsym-scripts-changes
##
wget https://invisible-island.net/datafiles/release/other-scripts.tar.gz
wget https://invisible-island.net/scripts/other-scripts/CHANGES.html
mv CHANGES.html other-scripts-changes.html
wget https://invisible-island.net/scripts/other-scripts/CHANGES
mv CHANGES other-scripts-changes
##
# Note: Make sure to explore more links and tools in https://invisible-island.net/scripts/readme.html and elsewhere in https://invisible-island.net/
#
wget https://invisible-island.net/personal/git-exports.html #Xorg libs used by XTerm and apps related to those libs
# https://invisible-island.net/personal/git-exports.html#others # see what can be linked or forked under Other stuff, and where to incorporate it in the docs website
#
wget https://invisible-island.net/ncurses/ncurses.html
wget https://invisible-island.net/ncurses/INSTALL.html
wget https://invisible-island.net/ncurses/ncurses-license.html
wget https://invisible-island.net/ncurses/announce.html
wget https://invisible-island.net/ncurses/man/ # ADD ALL LINKS FROM THIS PAGE AS NEW PAGES!
wget https://invisible-island.net/ncurses/ncurses.faq.html
wget https://invisible-island.net/ncurses/NEWS.html
wget https://invisible-island.net/ncurses/NEWS.gz
# more ncurses-related content targets to add for download here from https://invisible-island.net/ncurses/ncurses.html
#
wget https://invisible-island.net/xterm/xtoolkit/xtoolkit.html #X Toolkit links
# wget https://github.com/freedesktop/xorg-libXt/commit/85eb751e4e1683af6cee3ee9dce29f74911a639d
# the previous link is now a 404 page, hence reuploading last copy from the main branch of this repo:
wget https://raw.githubusercontent.com/xterm-x11/docs/main/xterm-on-invisible-island/85eb751e4e1683af6cee3ee9dce29f74911a639d
wget https://invisible-island.net/xterm/xtoolkit/intrinsics.html # manpage?
wget https://invisible-island.net/xterm/xtoolkit/intrinsics.pdf
wget https://invisible-island.net/xterm/xtoolkit/manpage-index.html # include all linked pages after the first link because those are separate pages

git add .

git commit -m "downstreaming at $(date -Iminutes)"

git log -1 --oneline

git push -u origin downstreaming_$(date -I)

git switch main

git branch -D downstreaming_$(date -I)

echo "https://github.com/xterm-x11/docs/pull/new/downstreaming_$(date -I)"
