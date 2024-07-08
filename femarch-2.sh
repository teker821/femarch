locale-gen
vim /etc/hostname
passwd

pacman -S grub-install
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB