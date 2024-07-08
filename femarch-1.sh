timedatectl

# file system stuf
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1
mkdir /mnt/boot
mount /dev/sda3 /mnt
mount /dev/sda1 /mnt/boot
swapon /dev/sda2

# pacstrap and chroot
pacman-key --init
pacman-key --populate
pacstrap -K /mnt base linux linux-firmware vim networkmanager curl grub-install man
genfstab -U /mnt >> /mnt/etc/fstab
echo "\a"
arch-chroot /mnt