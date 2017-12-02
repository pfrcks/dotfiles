# setupi3

This is an experimental project to setup up a nice i3 desktop environment running on Ubuntu 15.04.

The setup steps are mostly following this youtube tutorial by Alex:
https://www.youtube.com/watch?v=j1I63wGcvU4.

## Usage:

```
git clone https://github.com/Xunius/setupi3.git && cd setupi3
sudo ./setupi3.sh
```

## Major changes performed by the `setupi3.sh` 

### Install i3
```
sudo apt-get update
sudo apt-get install i3 i3-wm i3blocks i3lock i3status 
```

### Configure

The configure file for i3 is located (by default) at:
```
~/.i3/config
```

Download the files from dropbox
```
dropbox/dotfiles/i3/config i3blocks.conf toggletouchpad.sh
```
and save to the above folder.




### Enable multimedia keys

1. Install *pactl*, *xbacklight*: 
```
sudo apt-get install pactl xbacklight
```

2. Install *playerctl*:

Download the package from:
https://github.com/acrisci/playerctl/releases

Then `sudo dpkg -i the_package.deb`

3. Paste the following snippet to the end of config file.

```
# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound

# Screen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness

# Touchpad controls
bindsym XF86TouchpadToggle exec ~/.i3/toggletouchpad.sh # toggle touchpad
```

bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous


4. Create a `toggletouchpad.sh` script in the `~/.i3/` directory, with the following content:

```
#!/bin/bash
if synclient -l | grep "TouchpadOff .*=.*0" ; then
    synclient TouchpadOff=1 ;
else
    synclient TouchpadOff=0 ;
fi
```



### [Optional] Set custom wallpaper

The line for setting custom wallpaper has been added (but commented)
out in the config file.

Before activating that line, need to install *feh*:
```
sudo apt-get install feh
```


### Bound an app to a workspace

A certain app will be launched only in a specified workspace.
Take the *firefox* for example.

1. Launch firefox, and an empty terminal.
2. In the terminal, run `xprop`, then click the firefox window to
   show the app info. Look for the line "WM_CLASS(STRING)", and
   take a note of the 2nd field, for firefox it's "Firefox".
3. In the config file, add
```
assign [class="Firefox"] $workspace1
```


### Install *Font Awesome*

This is to enable icons in workspace names, as defined in
the i3 config file.

1. Go to `https://github.com/FortAwesome/Font-Awesome/releases`
and download the font file zip.

2. Unzip the file, copy the .ttf font files to `/etc/share/fonts`.

3. The icon cheetsheet: https://fortawesome.github.io/Font-Awesome/cheatsheet/


### Install system font

This is to enable System font setting in the i3 config file.

1. Go to https://github.com/supermarin/YosemiteSanFranciscoFont.
2. Download the font zip file, unzip it.
3. Copy all the .ttf files to `/etc/share/fonts/`


### Apply the system font to GTK applications.

1. Install lxappearance
```
sudo apt-get install lxappearance
```
2. Launch lxappearance, and set **Default font** to **SFNS Display**.


### Fix file explorer (Nautilius, Nemo) issues

1. Install icons: `sudo apt-get install gnome-icon-theme-full
`

2. Add lines (already in i3 config) to fix the desktop issue.


### Install *Arch GTK* theme

1. Go to https://github.com/horst3180/Arc-theme.
2. Follow the installation steps using packages.
3. Launch *lxappearance* and choose the installed theme.


### Install *Arch firefox* theme

1. Go to https://github.com/horst3180/arc-firefox-theme
2. Install inside firefox


### Install *Rofi*, as a replacement of *dmenu*

1. Install `sudo apt-get install rofi`
2. Replace `dmenu_run` command with a rofi command in the i3 config file.


### Install *compton*, to enable transparency effect of *rofi*

1. Install `sudo apt-get install compton`
2. Add `exec_always compton -f` in the i3 config file


### Customize bar using i3blocks instead of i3status

The default status bar is updated using *i3status*. Change this to *i3blocks* which is easier to control.

1. Copy the default *i3blocks* config file:
```
cp /etc/i3blocks.conf ~/.i3/
```

2. Use *i3blocks* in the **bar** section of the i3 config file.

3. Edit the `~/.i3/i3blocks.conf` file.




### Fix the **volume** bar block problem

The command i3blocks uses to detect the system volume is located
at `/usr/share/i3blocks/volume`.

Need to change this to `/usr/share/i3blocks/volume 5 pulse` to correctly detect. This should be added in the [volume] section in the `i3blocks.conf` file.
