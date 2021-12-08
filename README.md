# Auto Arch
This is my personal Arch Linux installation script. This script will install the BSPWM tiling window manager and the Alacritty terminal emulator.

# Instructions:
> **Before chrooting into the system**
- Partition the disk using the tool of your choice (fdisk, cfdisk, etc)
- Connect to the internet if not already connected (iwctl).
- Download the script: `curl -Lo one.sh tinyurl.com/aa-one`
- Make it executable: `chmod +x one.sh`
- Run the script: `bash one.sh`
- Answer the prompts.
- Chroot into the system: `arch-chroot /mnt`

> **After chrooting into the system**
- Download the second script: `curl -Lo two.sh tinyurl.com/aa-two`
- Make it executable: `chmod +x two.sh`
- Run the script: `bash two.sh`
- Answer the prompts.

> **After first boot**
- Download the third script: `curl -Lo three.sh tinyurl.com/aa-three`
- Make it executable: `sudo chmod +x three.sh`
- Run the script: `zsh three.sh`
- Wait for the script to configure the system.

