!!! tip

You can read this website in a terminal by installing and running [Lynx](https://lynx.browser.org/).

# Configuring XTerm

Almost all of XTerm's configuration is described in terms of X resources (see [archlinux.org](https://wiki.archlinux.org/title/X_resources) and [stuff.mit.edu](https://stuff.mit.edu/afs/sipb/project/doc/ixresources/xres.html)). For desktop users, X resources are typically stored in the `~/.Xresources` dotfile. (For additional details, see the section *~/.Xresources for advanced use cases* further below.)

The X resources that you can configure for XTerm are listed in the XTerm manpage, which is available as `$ man xterm` or [online](https://invisible-island.net/xterm/manpage/xterm.html#h2-RESOURCES).
<!-- Update the above par when the template file is completed:
The X resources that you can configure for XTerm are listed in the [template](https://github.com/xterm-x11/files.Xresources/blob/main/template.Xresources) file and in the XTerm manpage, which is available as `$ man xterm` or [online](https://invisible-island.net/xterm/manpage/xterm.html#h2-RESOURCES).
-->

To configure XTerm on a system, simply download or create and edit your `~/.Xresources` dotfile, and then run the `xrdb` command to load the X resources from your `~/.Xresources` dotfile. See the next sections for step-by-step instructions.

## Checking for the ~/.Xresources dotfile

Before doing anything regarding the `~/.Xresources` dotfile, first check if you already have it in the system's user home directory. Because `~/.Xdefaults` and `~/.Xdefaults-*` are other dotfiles where X resources might be stored, you can check for their presence too. Read the output of the command to find out:

`$ ls -a ~/.Xresources ~/.Xdefaults ~/.Xdefaults-*`

!!! tip

The easiest way to start with a `~/.Xresources` dotfile is to download and use the [sample](https://github.com/xterm-x11/files.Xresources/blob/main/sample.Xresources) file (see instructions inside that file). Alternatively, you can run `$ touch ~/.Xresources` to create a blank one where you can add XTerm configuration lines.

## Checking the loaded X resources

Run `$ xrdb -query` to view the loaded X resources.

!!! tip

This command might be useful after editing the `~/.Xresources` dotfile.

## Loading the X resources from the ~/.Xresources dotfile

Run `$ xrdb -merge ~/.Xresources`.

## Updating the ~/.Xresources dotfile

1\. Edit your `~/.Xresources` dotfile, adding or removing XTerm parameters or changing their values.

2\. Run `$ xrdb -merge ~/.Xresources` to load the updated X resources. (If you get any error messages in the output, edit the `~/.Xresources` file to resolve the errors.)

3\. Open a new XTerm window by running `$ xterm &` to visually verify the changes in the window.

## ~/.Xresources for advanced use cases

### Referencing another file in `~/.Xresources`

You can reference another file in the `~/.Xresources` dotfile with an absolute path, for example `/home/<user>/...`, not using the tilde `~`. This means you can load XTerm's X resources from another file by adding the following statement on a line in `~/.Xresources`:

`#include "/<absolute_path_to_file>/<file_with_x_resources_for_xterm>"`

### Differences between `.Xresources` and `.Xdefaults`

* `.Xresources` are loaded into the X server, so are linked to a particular display environment.

"For most desktop environments, ~/.Xresources should be loaded at login.  Note that if you make changes, you will need to run xrdb to pick them up. In my case, typically I care more about the server than the client for things like font size: for example, when using my laptop the resources are configured to suit a 14" screen at a particular resolution, and those same settings are used when I run xvile either locally, or remotely on my workstation over ssh.  When sitting at my workstation which has a somewhat larger screen, I want different settings configured in the X server.  By using .Xresources rather than .Xdefaults the same invocation of xvile behaves appropriately depending on where it is being displayed, rather than where was invoked from." [*Source*](https://lists.nongnu.org/archive/html/vile/2019-11/msg00002.html) "`.Xresources` works using `ssh -x`. I thought that my window manager would automatically load `.Xresources`, but it doesn't do so.  Modifying my `.xinitrc` fixes the problem." [*Source*](https://lists.nongnu.org/archive/html/vile/2019-11/msg00004.html)

* `.Xdefaults` are set based on the client.

### .Xdefaults-*host* and XENVIRONMENT

"On POSIX-based systems, the user's environment resource file name is specified by the value of the `XENVIRONMENT` Environment Variable. If this environment variable does not exist, the user's home directory is searched for a file named `.Xdefaults-<host>`, where `<host>` is the host name of the machine on which the application is running." [*Source*](https://www.x.org/releases/X11R7.7/doc/libXt/intrinsics.html)

### XAPPLRESDIR

Another in-depth alternative is to set `XAPPLRESDIR`, which lets one set up a directory where X will search for an `.Xresources` dotfile:

```
       application-specific files
               Directories named by the environment variable  XUSERFILESEARCH‐
               PATH  or  the  environment  variable XAPPLRESDIR (which names a
               single directory and should end with a '/' on  POSIX  systems),
               plus   directories   in   a   standard   place  (usually  under
               /usr/share/X11/, but this can be  overridden  with  the  XFILE‐
               SEARCHPATH  environment variable) are searched for for applica‐
               tion-specific  resources.   For  example,  application  default
               resources  are  usually  kept  in /usr/share/X11/app-defaults/.
               See the X Toolkit Intrinsics - C Language Interface manual  for
               details.
```
[*Source*](https://lists.nongnu.org/archive/html/vile/2019-11/msg00002.html)

[*X Toolkit Intrinsics - C Language Interface*](https://www.x.org/releases/X11R7.7/doc/libXt/intrinsics.html) discusses this as well.

## Additional resources

Run `$ xrdb -help` or see the [xrdb](https://www.x.org/releases/X11R7.7/doc/man/man1/xrdb.1.xhtml) manpage for more `xrdb` options.

!!! warning

Running some of the `xrdb` options interferes with dynamic loading of X resources by applications.

!!! warning

If you decide to use `$ xrdb -remove`, be aware that it clears **(!)** *all* previously loaded X resources, including the X resources that were loaded at login.
