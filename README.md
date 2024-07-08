# FemArch

<img src="img/transflag.png" alt="transflag" style="width:512px;"/>

# Install

1. Flash an Arch ISO using Balena Etcher (or a custom tool that will probably come soon)
2. Connect to the internet using `iwctl` or `mmcli`
3. Format your disks using `cfdisk` or `fdisk`, FemArch's disk mapping is:
```txt
sda1: boot/efi (recomended to be 1 GB)
sda2: swap     (recomended to be double of ram)
sda3: root     (recomended to be rest of disk/disks)
```
4. Run the following command: `curl https://raw.githubusercontent.com/teker821/femarch/main/femarch-1.sh | sh`
5. Run `arch-chroot /mnt`
6. After that finishes, run: `curl https://raw.githubusercontent.com/teker821/femarch/main/femarch-2.sh | sh` (note: you can stop here. But if you do, then it's not really FemArch)
7. Run `nmcli device wifi connect {NETWORK_NAME} password {NETWORK_PASS}` (plz replace those two standouts with your network name and password)
8. Run `curl https://raw.githubusercontent.com/teker821/femarch/main/femarch-3.sh | sh`
9. Follow along :3