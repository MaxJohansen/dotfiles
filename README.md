# Dotfiles
These are the dotfiles that allow me to bootstrap a brand new system. I prefer to use the Manjaro distribution, but if I'm forced to use Windows then 
my configuration uses [Arch for WSL](https://github.com/yuk7/ArchWSL) and tries its best to behave nicely.

The current setup uses [Homemaker](https://foosoft.net/projects/homemaker/) to bootstrap a system. The `homemaker` directory contains precompiled binaries for all of the systems I use, so no further downloads are necessary.

## Common
* [fish](https://fishshell.com/) - The fish shell owns bones

## Arch Linux

Uses [yay](https://github.com/Jguer/yay) as a package manager for AUR.

Installs the following packages
* [bat](https://github.com/sharkdp/bat) - A better `cat`
* [jq](https://github.com/stedolan/jq) - For munging JSON data
* [pup](https://github.com/EricChiang/pup) - For munging HTML data
* [tldr](https://github.com/tldr-pages/tldr) - When you don't have time for man pages

## Linux only GUI setup

The dotfiles attempt to style everything with the [Nord](https://arcticicestudio.github.io/nord/) color palette.

* [vivaldi](https://vivaldi.com) - Browser 🎨
* [code](https://code.visualstudio.com/) - Editor 🎨
* [zathura](https://github.com/pwmt/zathura) - A simple document viewer (primarily PDF and ps) [🎨](config/zathurarc)
* [okular](https://okular.kde.org/) - Heavier document viewer, handy for filling out PDF forms
* [kitty](https://sw.kovidgoyal.net/kitty/) - An amazing terminal emulator [🎨](config/kitty.conf)
* [spotify](https://spotify.com) - Gotta get my jams on
* [rofi](https://github.com/DaveDavenport/rofi) - Launcher, menu and window switcher [🎨](config/rofi)
* [rofi-greenclip](https://github.com/erebe/greenclip) - Clipboard manager that integrates with rofi
* [autorandr](https://github.com/phillipberndt/autorandr) - Automatically configures screen layouts
* [maim](https://github.com/naelstrof/maim) - Like scrot but better
* [gloom](https://github.com/shizy/gloom) - Hides cursor, dims monitor after a while, locks screen automatically

## Windows Subsystem for Linux

This does not attempt to install any of the GUI tools, so your life will suck. No kitty? uuurgh
