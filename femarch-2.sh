locale-gen
read -p "Enter Hostname: " hostname
echo "${hostname}" > /etc/hostname
passwd

# install grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

# update Arch
pacman-key --init
pacman-key --populate
pacman -Syu --devel

curl https://raw.githubusercontent.com/teker821/femarch/main/res/motd > /etc/motd
echo "Reboot for changes to take affect"
exit