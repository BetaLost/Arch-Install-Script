# Arch Linux Installation Script
This is my personal Arch Linux installation script. This script will install either the Awesome window manager (awesomewm) and the Alacritty terminal emulator OR the Dynamic Window Manager (dwm) and the simple terminal emulator (st).

# Instructions:
> **Before chrooting into the system**
- Partition the disk using the tool of your choice (fdisk, cfdisk, etc)
- Connect to the internet if not already connected (iwctl).
- Download the script: `curl -L tinyurl.com/vjh-pre-chroot > pre-chroot.sh`
- Make it executable: `chmod +x pre-chroot.sh`
- Run the script: `./pre-chroot.sh`
- Answer the prompts.

- Chroot into the system: `arch-chroot /mnt`

> **After chrooting into the system**
- Download the second script: `curl -L tinyurl.com/vjh-chroot > chroot.sh`
- Make it executable: `chmod +x chroot.sh`
- Run the script: `./chroot.sh`
- Answer the prompts.

> **After base install**
- Download the third script: `curl -L tinyurl.com/vjh-awesomewm > awesomewm.sh`/`curl -L tinyurl.com/vjh-dwm > dwm.sh`
- Make it executable: `chmod +x awesomewm.sh`/`chmod +x dwm.sh`
- Run the script: `./awesomewm.sh`/`./dwm.sh`
- Wait for the script to install the packages.
- Exit chroot: `exit`
- Boot into the system: `reboot` (Make sure to remove the install medium)

> **After first boot**
- Download the fourth script: `curl -L tinyurl.com/vjh-awesomewm2 > awesomewm2.sh`
- Make it executable: `sudo chmod +x awesomewm2.sh`
- Run the script: `./awesomewm2.sh`
- Wait for the script to install more packages and configure the system.
