timedatectl

# file system stuf
umount /dev/sda1
umount /dev/sda2
umount /dev/sda3
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1
mount --mkdir /dev/sda1 /mnt/boot/efi
mount /dev/sda3 /mnt
swapon /dev/sda2

# pacstrap and chroot
pacman-key --init
pacman-key --populate
pacstrap -K /mnt base linux linux-firmware vim networkmanager curl grub man
genfstab -U /mnt >> /mnt/etc/fstab
echo -en "\007"