#!/bin/bash

# Install packages
pacman -Syu --noconfirm lightdm lightdm-gtk-greeter awesome xorg-server xterm gnome-terminal wget ttf-dejavu

# Get username
while IFS= read -r line
do
    USERNAME=$line
done < username.txt
rm username.txt

# Lightdm autologin
echo "autologin-user=$USERNAME" >> /etc/lightdm/lightdm.conf
echo "autologin-session=awesome" >> /etc/lightdm/lightdm.conf
groupadd -r autologin
gpasswd -a $USERNAME autologin
systemctl enable lightdm.service

# Get default awesomewm config
CONF_DIR="/home/$USERNAME/.config/awesome"
mkdir -p $CONF_DIR
cp /etc/xdg/awesome/rc.lua $CONF_DIR
CONF_FILE=$CONF_DIR/rc.lua

# Edit configuration
wget -O /home/$USERNAME/wallpaper.png tinyurl.com/vjh-wallpaper
echo "awful.spawn.with_shell(\"feh --bg-scale /home/$USERNAME/wallpaper.png\")" >> $CONF_FILE
sed -i "s/titlebars_enabled = true/titlebars_enabled = false/g" $CONF_FILE
sed -i "s/terminal = \"xterm\"/terminal = \"gnome-terminal\"/g" $CONF_FILE
sed -i "s/awful.key({ modkey,           }, \"w\", function () mymainmenu:show() end,/-- awful.key({ modkey,           }, \"w\", function () mymainmenu:show() end,/g" $CONF_FILE
sed -i "s/{description = \"show main menu\", group = \"awesome\"}),/-- {description = \"show main menu\", group = \"awesome\"}),/g" $CONF_FILE
sed -i "s/awful.key({ modkey, \"Shift\"   }, \"c\",      function (c) c:kill()                         end),/awful.key({ modkey, }, \"w\",      function (c) c:kill()                         end),/g" $CONF_FILE
sed -i "s/awful.key({ modkey,           }, \"Return\", function () awful.util.spawn(terminal) end),/awful.key({ modkey,           }, \"t\", function () awful.util.spawn(terminal) end),/g" $CONF_FILE
sed -i "s/awful.key({ modkey,           }, \"t\",      function (c) c.ontop = not c.ontop            end),/awful.key({ modkey, \"Shift\"}, \"t\",      function (c) c.ontop = not c.ontop            end),/g" $CONF_FILE
