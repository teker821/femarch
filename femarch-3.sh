# beginning
read -p "Continue? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
su root
pacman-key --init
pacman-key --populate

# user stuf
read -p "Enter new user name: " user
useradd -m $user
useradd -g games lp users $user
read -p "Should ${user} be a superuser (sudo)?: (y/n)" confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] || $confirm == [nN] || $confirm == [nN][oO]]]
if confirm == $confirm == [yY] || $confirm == [yY][eE][sS] then
    useradd -g wheel $user
fi
passwd $user

# installation directory
mkdir /etc/inst_temp
cd /etc/inst_temp

pacman -S git zsh gcc g++ makefile links fastfetch dwarffortress

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install AUR pacakages
yay -S nscde-git librewolf ani-cli-git

# install zsh
chsh -s /usr/bin/zsh
touch /home/$user/.zshrc
touch /home/$user/.zshenv
touch /home/$user/.zprofile
curl https://raw.githubusercontent.com/teker821/femarch/main/res/zshrc > /home/$user/.zshrc
curl https://raw.githubusercontent.com/teker821/femarch/main/res/zshenv > /home/$user/.zshenv
curl https://raw.githubusercontent.com/teker821/femarch/main/res/zprofile > /home/$user/.zprofile

# user dir stuf
cd /home/$user/
mkdir downloads
mkdir documents
mkdir images

# NsCDE stuff
mkdir .nscde
cd ./.nscde/
mkdir photos
curl https://raw.githubusercontent.com/teker821/femarch/main/img/wallpaper.png -o jh_mountain.png

# finish up
curl https://raw.githubusercontent.com/teker821/femarch/main/res/motd2 > /etc/motd
yay -Syu --devel
pacman -Syu --devel
echo "\a"
echo "Restart for changes to take affect"