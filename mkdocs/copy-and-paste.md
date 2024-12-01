author: Max Leonov

!!! tip

You can read this website in a terminal by installing and running [Lynx](https://lynx.browser.org/).

# Copy and paste

## Selecting text in XTerm

You can easily select text in an XTerm window as you would expect in another application:

* Left-click and drag to select any text.
* Double-click to select a word.
* Triple-click to select the whole line.

!!! tip

XTerm's X resources enable you to configure how much of text you wish to get selected on multiple clicks, adjust the clicking speed (as time interval) for multiple clicks, include or exclude the new line, and more. For more information, see [Configure](configure.md) and [Customize copy and paste](customize-copy-and-paste.md).

With a mouse or trackball that has a scroll wheel, you can extend your initial selection beyond the visible screen in an XTerm window:

1\. Make your initial selection by left-clicking and dragging to highlight text.

2\. Scroll down (or up) to where you want to continue the started selection.

3\. Right-click precisely on the line and column where you want to complete the selection.

If the selection is very long, you can continue to scroll and right-click to extend the selection multiple times.

!!! note

Right-clicking means using mouse button 3, and scrolling works as described when XTerm is not using the mouse protocol.


## Copying text in XTerm

By default, XTerm automatically copies every text selection you make in an XTerm window. You don't need to press any keyboard shortcuts (like **Ctrl+C**) or go into any menu (like clicking a **Copy** button). XTerm has already copied the selected text.

!!! warning

Unconfigured XTerm copies text to the PRIMARY buffer rather than CLIPBOARD that most applications use nowadays. Unless you prefer or need to use the PRIMARY buffer on purpose, it's best that you configure XTerm to copy all text to CLIPBOARD instead. To do that, all you need to do is add the `XTerm.vt100.selectToClipboard: true` X resource to your dotfile (this is already `true` in [sample.Xresources](https://github.com/xterm-x11/files.Xresources/blob/main/sample.Xresources)). For more information, see [Configure](configure.md) and [Customize copy and paste](customize-copy-and-paste.md).

!!! tip

You can configure XTerm to work with a keyboard shortcut to copy text if you can't get used to the convenience of not having to press any keys to copy. For how to set a custom keyboard shortcut, see [Configure](configure.md) and [Customize copy and paste](customize-copy-and-paste.md).

## Pasting text in XTerm

By default, to paste copied text into an XTerm window, use the **Shift+Insert** keyboard shortcut or the middle mouse button (if your mouse or trackpad has one).

!!! tip

Depending on your system, you should be able to use the **Shift+Insert** keyboard shortcut for pasting text copied from an XTerm window into other applications (like **Ctrl+V**). If you stick with using the **Shift+Insert** keyboard shortcut in XTerm, it's easier to remember and more convenient to use this same shortcut every time you paste text copied to or from XTerm.

!!! tip

You can set a custom keyboard shortcut for pasting selected text. For how to do that, see [Configure](configure.md) and [Customize copy and paste](customize-copy-and-paste.md). This is useful in some situations such as when the keyboard you're using doesn't have a dedicated **Insert** button, making it difficult to press **Shift+Insert**.

!!! tip

If your hardware doesn't have the middle mouse button, you might be able to set up emulation to use both the left and right mouse buttons instead of the middle mouse button.
