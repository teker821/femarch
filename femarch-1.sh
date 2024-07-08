timedatectl
cfdisk

# file system stuf
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1
mkdir /mnt/boot
mount /dev/sda3 /mnt
mount /dev/sda1 /mnt/boot
swapon /dev/sda2

pacstrap -K /mnt base linux linux-firmware vim git networkmanager sudo
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt