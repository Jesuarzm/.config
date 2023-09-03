<!-- HEADERS -->
<p align="center">
  <img width="25%" src="https://avatars.githubusercontent.com/u/102948200?v=4" />
</p>

<p align="center">
  <b> ~ Jesuar's configuration files ~ </b>
</p>

<!-- INFORMATION -->

### Thanks for dropping by!

<img src="https://github.com/Jesuarzm/Dotfiles/blob/master/bspwm_1.png" alt="img" align="right" width="400px">


This is my personal collection of configuration files.

This is a small fork of [**Aesthetic BSPWM**](https://github.com/rxyhn/tokyo) configuration by by [**Rxyhn**](https://github.com/rxyhn) .

The [setup section](#setup) will guide you through the installation process.

Here are some details about my setup:

- **WM:** [bspwm](https://github.com/baskerville/bspwm) & [Hyprland](https://github.com/hyprwm/Hyprland)
- **OS:** [Arch Linux](https://archlinux.org)
- **Terminal:** [kitty](https://github.com/kovidgoyal/kitty)
- **Shell:** [zsh](https://wiki.archlinux.org/index.php/Zsh)
- **Widgets:** [eww](https://github.com/elkowar/eww)
- **Compositor:** [picom](https://github.com/ibhagwan/picom)
- **Browser:** [brave](https://brave.com/es/)
- **File Manager:** [nemo](https://github.com/linuxmint/nemo)
- **Application Launcher:** [rofi](https://github.com/davatorium/rofi)

---

<!-- SETUP -->

## Setup For Bspwm.

> This is step-by-step how to install these bspwm dotfiles. Just [R.T.F.M](https://en.wikipedia.org/wiki/RTFM).

### Installation (Manual)

> After cloning the repository, install the necessary dependencies to replicate by setup.

   <details open>
   <summary><strong>Arch Linux (and Arch-based distributions)</strong></summary>

> Assuming your **AUR Helper** is [yay](https://github.com/Jguer/yay).

```sh
yay -S bspwm sxhkd nemo rofi kitty calcurse todotxt \
 feh jq dunst betterlockscreen playerctl maim \
 xclip imagemagick

```

   </details>

   <br>

 <details open>
   <summary><strong>We also need the picom of Zaney</strong></summary>
   
> Clone the repository [picom](https://gitlab.com/Zaney/picom).
```sh
  git clone https://gitlab.com/Zaney/picom
  cd picom
  $ git submodule update --init --recursive
  $ LDFLAGS="-L/usr/X11R6/lib -L/usr/local/lib" CPPFLAGS="-I/usr/X11R6/include -I/usr/local/include" meson --buildtype=release . build
  $ ninja -C build

```
> To build.

```sh
  $ git submodule update --init --recursive
  $ LDFLAGS="-L/usr/X11R6/lib -L/usr/local/lib" CPPFLAGS="-I/usr/X11R6/include -I/usr/local/include" meson --buildtype=release . build
  $ ninja -C build

```
> To install

```sh
 $ ninja -C build install
```

> Then after the dependencies are installed, copy the files to it's respective folders.

   <details open>
   <summary><strong>Config and Binaries</strong></summary>

```sh
 $ mkdir -p $HOME/.config/ && cp -r ./Bswpm/* $HOME/.config/
 $ mkdir -p $HOME/.local/bin/ && cp -r ./Bswpm/bin/* $HOME/.local/bin/

```

   </details>

   <br>

> You will need to install a few fonts.

- **Cartograph CF:** [here](https://coding-fonts.css-tricks.com/fonts/cartograph-cf/)
- **JetBrainsMono NF:** [here](https://github.com/ryanoasis/nerd-fonts)
- **Font Awesome:** [here](https://fontawesome.com/download)
- **Comic Mono :** [here](https://dtinth.github.io/comic-mono-font/)

   <br>

> Once finished copying the files, you might want to finalize the changes to your system.

```sh
 # Rebuilds the font cache
 $ fc-cache -fv
```

   <br>

> Lastly, log out from your current desktop session and log in into bspwm.

   <br>

## Miscellaneous.

- **Elkowar's Wacky Widgets**

  > If you're **NOT** using a monitor with a 1920x1080 resolution, you might want to change the `x` and `y` values of the widgets on the config.


- **Thanks to**

  - [niraj](https://github.com/niraj998/) for some widgets.

   <br>

<p align="center"><a href="https://github.com/rxyhn/bspdots/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=flat-square&label=License&message=GPL-3.0&logoColor=eceff4&logo=github&colorA=1A1B26&colorB=F7768E"/></a></p>
