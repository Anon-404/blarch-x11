#! /bin/bash
#
##########################################
#                                        #
#          presented : Anon404           #
#        Author : William Steven         #
#                                        #
##########################################
#____colors____
black='\033[1;30m'
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
magenta='\033[1;35m'
cyan='\033[1;36m'
white='\033[1;37m'

banner(){
    clear
    echo -e "${blue}________________________________________________________________"
    echo ""
    echo "    ____  __    ___    ____  ________  __     _  ________"
    echo "   / __ )/ /   /   |  / __ \/ ____/ / / /    | |/ <  <  /"
    echo "  / __  / /   / /| | / /_/ / /   / /_/ /_____|   // // / "
    echo " / /_/ / /___/ ___ |/ _, _/ /___/ __  /_____/   |/ // /  "
    echo "/_____/_____/_/  |_/_/ |_|\____/_/ /_/     /_/|_/_//_/   "
    echo "                                                         "
    echo -e "${green}presented by : Anon404"
    echo "created by : William Steven"
    echo -e "${blue}________________________________________________________________"
    echo ""
}

pkgInstaller(){
    echo ""
    echo -e "${yellow}[+] ${green}Updating system before installation ${white}"
    sudo pacman -Syu --noconfirm
    for i in dialog tzdata fluxbox librsvg inetutils dbus gtk-engine-murrine firefox at-spi2-core pulseaudio 
    do
        if [ -f /var/lib/pacman/db.lck ]
        then
            sudo rm -rf /var/lib/pacman/db.lck
        fi
        echo ""
        echo -e "${yellow}[+] ${green}Installing $i ${white}"
        echo ""

        while ! sudo pacman -S --noconfirm $i --needed; do
            echo -e "${red}[-] Failed to install $i. Retrying...${white}"
            sleep 2
        done

        echo -e "${green}[+] Successfully installed $i ${white}"
    done
}

blconf(){
    echo -e "${yellow}[+] ${green}Configuring Arch Linux for BlackArch ${white}"
    echo ""

    for x in blackarch-wallpaper blackarch-config-x11 blackarch-config-fluxbox
    do
        if [ -f /var/lib/pacman/db.lck ]
        then
            echo -e "${yellow}[+] ${green}Removing lock file ${white}"
            sudo rm -rf /var/lib/pacman/db.lck
        fi

        echo ""
        echo -e "${yellow}[+] ${green}Installing $x ${white}"
        echo ""

        while ! sudo pacman -S --noconfirm $x --needed; do
            echo -e "${red}[-] Failed to install $x. Retrying...${white}"
            sleep 2
        done

        echo -e "${green}[+] Successfully installed $x ${white}"
    done
    touch .Xdefaults .Xresources
    echo -e "${yellow}[+] ${green}Copying xprofile to /etc/xprofile ${white}"
    sudo cp -a /usr/share/blackarch/config/x11/xprofile /etc/xprofile || echo -e "${red}Failed to copy xprofile${white}"

    echo -e "${yellow}[+] ${green}Copying Xresources to ~/.Xresources ${white}"
    sudo cp -a /usr/share/blackarch/config/x11/Xresources $HOME/.Xresources || echo -e "${red}Failed to copy Xresources${white}"

    echo -e "${yellow}[+] ${green}Copying Xdefaults to ~/.Xdefaults ${white}"
    sudo cp -a /usr/share/blackarch/config/x11/Xdefaults $HOME/.Xdefaults || echo -e "${red}Failed to copy Xdefaults${white}"

    echo -e "${yellow}[+] ${green}Copying fluxbox configuration ${white}"
    sudo rm -rf /usr/share/fluxbox || echo -e "${red}Failed to remove old fluxbox configuration${white}"
    sudo cp -a /usr/share/blackarch/config/fluxbox /usr/share/ || echo -e "${red}Failed to copy fluxbox configuration${white}"
    cat /usr/share/blackarch/config/x11/Xdefaults >> .Xdefaults
    cat /usr/share/blackarch/config/x11/Xresources >> .Xresources
}

vscode(){
    echo -e "${yellow}[+] ${green}Installing vscode${white}"
    echo ""
    git clone https://aur.archlinux.org/visual-studio-code-bin.git
    cd visual-studio-code-bin
    while ! makepkg -si ; do
        echo -e "${red}[-] Failed to installing vscode. Retrying...${white}"
        sleep 2
    done
    cd
    sudo rm -rf visual-studio-code-bin
}

note(){
   # creating x11-start file
   touch x11-start
   echo "#! /bin/bash" >> x11-start
   echo "export DISPLAY=:1" >> x11-start
   echo "startfluxbox > /dev/null 2>&1" >> x11-start

   chmod 777 x11-start && sudo mv x11-start /usr/bin

   banner
   echo -e "${yellow}[+] ${green}install ${cyan}termux x11${green} app from github"
   echo ""
   echo -e "${yellow}[+] ${green}simply type ${cyan}x11-start ${green}to start desktop environment"
   echo ""
   echo -e "${yellow}[+] ${green}open ${cyan}termux x11 ${green}app and enjoy"
   echo ""
   echo -e "${yellow}[+] ${green}stop x11 service by ${cyan}CTRL + C"
   echo ""
}

envsetup(){
     banner

     echo -e "${yellow}[+] ${green}installing and setting up themes icons wallpapers"
     echo ""
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/arch-linux-1920-x-1080-wallpaper-n3wmkn6n4ctn2j9m.jpg -O /usr/share/backgrounds/arch-linux-1920-x-1080-wallpaper-n3wmkn6n4ctn2j9m.jpg
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/com0613.jpg -O /usr/share/backgrounds/com0613.jpg
     wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/config.tar.xz


     sudo rm -rf .config
     sudo tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
     sudo tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
     sudo tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
     sudo tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
     sudo tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
     sudo tar -xvf config.tar.xz -C "$HOME/"


     sleep 4
}

fixSound() {
        echo -e "${yellow}[+] ${green}Fixing sound${white}"
        echo "$(echo "bash ~/.sound" | cat - /data/data/com.termux/files/usr/bin/arch)" > /data/data/com.termux/files/usr/bin/arch
        echo "export DISPLAY=:1" >> /etc/profile
        echo "export PULSE_SERVER=127.0.0.1" >> /etc/profile
        source /etc/profile
}

cleanup(){
     echo ""
     echo -e "${yellow}[+] ${green}refreshing system ${white}"
     echo ""
     rm -rf candy-icons-master.tar.xz Sweet-cursors.tar.xz Sweet-Ambar-Blue-Dark-v40.tar.xz config.tar.xz WhiteSur-Dark.tar.xz 01-WhiteSur.tar.xz
     sudo pacman -Syu --noconfirm
}

banner
pkgInstaller
#vscode
#envsetup
blconf
fixSound
cleanup
note
