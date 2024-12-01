<!-- 
// top menu
// 'Install'
// _'Package' = this page
// _'xterm.tar.gz'
-->

!!! tip

You can read this website in a terminal by installing and running [Lynx](https://lynx.browser.org/).

# Quick install on Linux

You can easily and quickly install XTerm on a command line on most GNU/Linux distributions by using a package manager:

1\. Some distributions include XTerm pre-installed by default. You can check if XTerm is already installed on your system by running the `xterm` command in the terminal. If XTerm is indeed pre-installed, skip the next steps and proceed to step 5 to configure XTerm.

2\. Before installing XTerm, verify that your system is using [X11](https://x.org/wiki/UserDocumentation/).

There are a few commands you can choose one from to check this:

`$ echo $XDG_SESSION_TYPE`

`$ printf 'Session is: %s\n' "${DISPLAY:+X11}${WAYLAND_DISPLAY:+WAYLAND}"`

`$ loginctl show-session $(awk '/tty/ {print $1}' <(loginctl)) -p Type | awk -F= '{print $2}'`

`$ loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type`

`$ loginctl show-session $(loginctl show-user $(whoami) -p Display --value) -p Type --value`

`$ loginctl show-session "$XDG_SESSION_ID" -p Type`

<!--
Also $ echo $WAYLAND_DISPLAY (prints nothing if Wayland is not used)
Source for the above commands:
https://unix.stackexchange.com/questions/202891/how-to-know-whether-wayland-or-x11-is-being-used/371164#371164
-->

3\. Run the package manager's installation command to install XTerm.

Here are the commands for installing XTerm from a package on some better-known distributions:

* Arch Linux: `$ pacman -Syu xterm`
<!-- source: https://bbs.archlinux.org/viewtopic.php?id=242823 -->

* Debian, Linux Mint: `$ sudo apt-get install xterm`
<!-- https://www.debian.org/releases/ and [APT](https://packages.debian.org/sid/apt) -->

* Ubuntu: `$ sudo apt install xterm`

* Fedora, Rocky Linux, CentOS Linux, CentOS Stream, RHEL: `$ sudo dnf install xterm.x86_64`

* openSUSE, SUSE Linux Enterprise: `$ sudo zypper install xterm`

If you are using another system, see the following two sections.

4\. Run XTerm to verify that it's been successfully installed: `$ xterm`

5\. Configure XTerm. See [internal-link-placeholder-to-some-other-page-about-configuring-xterm](https://xterm.org/some-other-page-about-configuring-xterm).

# Packages for Linux and UNIX systems

XTerm packages are available for the following systems:

[Adélie Linux](https://www.adelielinux.org/), [AlmaLinux](https://almalinux.org/), [Alpine Linux](https://www.alpinelinux.org/), [ALT Linux](https://en.altlinux.org/), [Amazon Linux 1](https://aws.amazon.com/amazon-linux-ami/), [Amazon Linux 2](https://aws.amazon.com/amazon-linux-2/), [AOSC OS](https://aosc.io/), [Apertis](https://www.apertis.org/), [Arch Linux](https://archlinux.org/), [Artix Linux](https://artixlinux.org/), [CentOS Linux](https://www.centos.org/centos-linux/), [CentOS Stream](https://www.centos.org/centos-stream/), [CRUX](https://crux.nu/), [Debian](https://www.debian.org/), [Deepin](https://www.deepin.org/index/zh), [Devuan](https://www.devuan.org/), [DragonFly BSD](https://www.dragonflybsd.org/), [EuroLinux](https://en.euro-linux.com/), [Exherbo](https://exherbo.org/), [Fedora](https://getfedora.org/), [FreeBSD](https://www.freebsd.org/), [Funtoo Linux](https://www.funtoo.org), [Gentoo Linux](https://www.gentoo.org/), [GoboLinux](https://gobolinux.org/), [Guix](https://guix.gnu.org/), [Kali Linux](https://www.kali.org/), [KaOS](https://kaosx.us/), [LiGurOS](https://liguros.gitlab.io/), [Linux Mint](https://www.linuxmint.com/), [Maemo](maemo.org/), macOS ([Homebrew](https://brew.sh/) or [MacPorts](https://www.macports.org/)), [Mageia](https://www.mageia.org/en/), [Manjaro Linux Open Source](https://manjaro.org/), [MidnightBSD](http://www.midnightbsd.org/), [MX Linux](https://mxlinux.org/), [NetBSD](https://netbsd.org/), [OpenBSD](https://www.openbsd.org/), [openEuler](https://www.openeuler.org/zh/), [OpenIndiana](https://www.openindiana.org/), [openmamba](https://openmamba.org/en/), [OpenMandriva](https://www.openmandriva.org/), [Oracle Solaris](https://www.oracle.com/solaris/), [openSUSE](https://www.opensuse.org/), [Parabola](https://www.parabola.nu/), [Pardus](https://www.pardus.org.tr/en/home/), [Parrot OS](https://parrotsec.org/), [PCLinuxOS](https://www.pclinuxos.com/), [Pisi Linux](https://pisilinux.org/), [PLD Linux](https://pld-linux.org/), [PureOS](https://pureos.net/), [RHEL](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux), [Raspbian](http://raspbian.org/), [Rocky Linux](https://rockylinux.org/), [ROSA Linux](https://www.rosalinux.ru/), [Sabayon Linux](https://www.sabayon.org/), [Scientific Linux](https://scientificlinux.org/), [Slackware Linux](http://www.slackware.com/), [SliTaz](https://www.slitaz.org/en/), [SUSE Linux Enterprise products](https://www.suse.com/products/), [T2 SDE Linux](http://t2sde.org/), [Trisquel](https://trisquel.info/), [Ubuntu](https://ubuntu.com/server/docs/package-management/), [Void Linux](https://voidlinux.org/)

If your system has an XTerm package available but is not listed, please open an issue at [xterm-x11/docs](https://github.com/xterm-x11/docs/issues) to let us know.

# XTerm package info

Before running the package manager's installation command to install XTerm, you can run a command to search for the XTerm package to find the correct package name in the package manager's repository.

In addition to the package search and package information that you can view on a command line from your package manager, the two following website provide information on almost all XTerm packages:

* https://pkgs.org/download/xterm. Find your system there on the list and click the package name to go to the package information page on https://pkgs.org/ where extensive information is available about the package, including the link to the package homepage.

* https://repology.org/project/xterm/versions. Find the package for your system and click the package name to be redirected to the package homepage.
