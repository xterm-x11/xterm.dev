!!! tip

    The X resources mentioned on this page are included in both the [template `.Xresouces` file](https://github.com/xterm-x11/files.Xresources/blob/main/template.Xresources) and the [sample `.Xresources` file](https://github.com/xterm-x11/files.Xresources/blob/main/sample.Xresources).

!!! note

    You can also use XTerm's command-line options as an alternative to the .Xresources file when needed.

# XTerm window properties

You can configure the following aspects of XTerm windows:

* Window border theme
* Inner border width
* Default window size

## Window border theme

The border theme of XTerm windows depends on the [window manager](https://wiki.archlinux.org/title/Window_manager) or more broadly the [desktop environment](https://wiki.archlinux.org/title/Desktop_environment) used. So to customize the border of XTerm windows, you need to research the available themes for your window manager and how to install a theme of your choice. For example: [Openbox Theme Collections](https://github.com/addy-dclxvi/openbox-theme-collections) or [xfce-look.org](https://xfce-look.org).

## Configuring the window internal border width

For XTerm, you can configure the thickness of the window internal border, which is the width of window between the window border (set by the window manager) and the outermost (leftmost and rightmost) columns and (top and bottom) lines of text within the XTerm window. You can set the XTerm window internal border thickness in pixels as an X resource:

```
xterm*internalBorder: 20
```

* The implicit default for the `xterm*internalBorder` Xresource is `2` pixels.

You can also color the window internal border:

```
xterm*colorInnerBorder: true
xterm*borderColor: green
```

* The implicit default for the `xterm*colorInnerBorder` Xresource is `false`, which means the color of the window internal border is the window background color.
* The `xterm*borderColor:` Xresource requires the `colorInnerBorder` Xresource to be explicitly set to `true`.

!!! note

    On some window managers, the window internal border might appear thicker in pixels when set to the default (`2` pixels) or minimal (`1` pixel) width values. XTerm sets window-manager hints such as to tell the window manager to do resizing in units that correspond to the font size or that the minimal window size is equal to the inner border (`2` when the border is set to `1`), but the hints and negotiation might not be correctly implemented in some window managers.

## Configuring the default window size

You can set the default window size as an X resource that is used when you open a new XTerm window:

* Maximized windows
* Fullscreen windows
* Custom-size windows
* Custom-size windows with an offset window position

### Configuring the maximized window size

You can configure XTerm to open maximized windows by default by setting the `maximized:` Xresource to `true`. The implicit default is `false`.

### Configuring the fullscreen window size

You can use the `fullscreen:` Xresource with one of the following values to configure whether the window manager opens fullscreen XTerm windows by default:

- `false` or `0` (implicit default)
- `true` or `1`
- `always` or `2`
- `never` or `3`

### Configuring a custom default window size

The Xresource that configures a custom default size for XTerm windows uses numbers of text columns and text lines as values:

```
xterm*geometry: <number_of_text_columns_you_want_in_xterm_windows>x<number_of_text_lines_you_want_in_xterm_windows>
```

The screen resolution, display size, and UI elements of the window manager or desktop environment such as menu or system bars affect the desired size of XTerm windows, which is something worth remembering when using two or more monitors.
So the best way to set the desired values for the `xterm*geometry` X resource is by testing it manually.
Here are some examples for 15-inch laptops, depending on the display size and UI elements in the used window manager:

`xterm*geometry: 106x54`

`xterm*geometry: 96x59`

`xterm*geometry: 94x48`

<!--- also link to this or copy this to the page about fonts --->

Because the default XTerm window size is specified in the `.Xresources` file in the units of columns and lines, the default XTerm window size is tied to the font size. In other words, if you change the `xterm*faceSize` font size in the `.Xresources` file, then the next time you open a new XTerm window, it will appear out of its intended proportions on the screen. So if you change the `xterm*faceSize` font size in the `.Xresources` file, you must also update the `xterm*geometry` Xresource, which sets the XTerm window geometry default, if you have set any, in your `.Xresources` file. For example, if you wish to increase XTerm's font size from `14` to `16`, you must update both lines as follows:

```
xterm*faceSize: 14
xterm*geometry: 96x59
```
```
xterm*faceSize: 16
xterm*geometry: 90x50
```

To conveniently determine your desired terminal window size for XTerm startup, you can drag and resize an XTerm window to the desired size and then run the `resize` script, which is included with XTerm.
The `resize` script prints your adjusted XTerm window size to standard output so that you can then copy and paste these values into the `xterm*geometry` line in the `.Xresources` file. Here is an example of this script's output:

```
$ resize
COLUMNS=110;
LINES=48;
```

## Adding window position offsets

Where an application window such as an XTerm window appears on the screen might depend on the window manager or desktop environment, its features, settings, and UI elements such as menu or system bars. You can have XTerm windows open at an offset position as follows, measured in pixels from the top left corner of the display area set for application windows:

```
xterm*geometry: <number_of_text_columns_you_want_in_xterm_windows>x<number_of_text_lines_you_want_in_xterm_windows>+<number_of_pixels_to_move_window_right>+<number_of_pixels_to_move_window_down>
```

To have an idea of the pixel ranges involved in effectively offseting new XTerm windows, you can print the screen resolution to standard output by running the `xrandr` command:

```
$ xrandr | grep \*
```

If you are using two or more monitors, different monitor resolution will cause different window position offsets.
