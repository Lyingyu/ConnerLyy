# change start mode

sudo update-grub

grep -q "quiet splash 3" /etc/default/grub
if [ $? -ne 0 ]; then
    echo "Now it's the desktop mode"
    sudo sed -i 's/quiet splash/quiet splash 3/g' /etc/default/grub
    sudo sed -i 's/#GRUB_TERMINAL=console/GRUB_TERMINAL=console/g' /etc/default/grub
else
    echo "Now it's the command line mode"
    sudo sed -i 's/quiet splash 3/quiet splash/g' /etc/default/grub
    sudo sed -i 's/GRUB_TERMINAL=console/#GRUB_TERMINAL=console/g' /etc/default/grub
fi

sudo update-grub
sudo reboot
