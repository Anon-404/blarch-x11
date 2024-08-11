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
        echo "   ___   ___  _______ __    _  ________"
        echo "  / _ | / _ \/ ___/ // /___| |/_<  <  /"
        echo " / __ |/ , _/ /__/ _  /___/>  < / // / "
        echo "/_/ |_/_/|_|\___/_//_/   /_/|_|/_//_/  "
        echo "                                       "
        echo -e "${green}presented by : Anon404"
        echo "created by : William Steven"
        echo -e "${blue}"
        echo -e "________________________________________________________________"
        echo ""
}

confrim(){
	echo -e "${yellow}[+] ${green}make sure your network quality isn't poor"
	echo -e "${yellow}[+] ${green}press enter to continue"
	read
}

addpkginstaller(){
    echo -e "${yellow}[+] ${green}Do you want to install additional packages (programming languages)? (y/N): \c"
    read opt1

    if [[ "$opt1" == "y" || "$opt1" == "Y" ]]; then
        for prg in php clang gcc python nodejs jdk-openjdk
        do
            if [ -f /var/lib/pacman/db.lck ]
            then
                sudo rm -rf /var/lib/pacman/db.lck
            fi
            echo ""
            echo -e "${yellow}[+] ${green}Installing $prg${white}"
            echo ""

            while ! sudo pacman -S --noconfirm $prg --needed; do
                echo -e "${red}[-] Failed to install $prg. Retrying...${white}"
                sleep 2
            done

            echo -e "${green}[+] Successfully installed $prg${white}"
        done
        echo -e "${yellow}[+] ${cyan}Successfully installed additional packages${white}"
    elif [[ "$opt1" == "n" || "$opt1" == "N" ]]; then
        echo "Okay 🙁"
    else
        echo -e "${red}[-] Wrong option entered!${white}"
        exit 1
    fi

    echo -e "${yellow}[+] ${green}Do you want to install penetration testing tools (hacking tools)? (y/N): \c"
    read opt2

    if [[ "$opt2" == "y" || "$opt2" == "Y" ]]; then
        for tools in nmap nikto hydra hashcat sqlmap tor dirb john bettercap ncat crunch cupp
        do
            if [ -f /var/lib/pacman/db.lck ]
            then
                sudo rm -rf /var/lib/pacman/db.lck
            fi
            echo ""
            echo -e "${yellow}[+] ${green}Installing $tools${white}"
            echo ""

            while ! sudo pacman -S --noconfirm $tools --needed; do
                echo -e "${red}[-] Failed to install $tools. Retrying...${white}"
                sleep 2
            done

            echo -e "${green}[+] Successfully installed $tools${white}"
        done

        echo -e "${yellow}[+] ${cyan}Successfully installed penetration testing tools${white}"
    elif [[ "$opt2" == "n" || "$opt2" == "N" ]]; then
        echo "Okay 🙁"
    else
        echo -e "${red}[-] Wrong option entered!${white}"
        exit 1
    fi
}



pkgInstaller(){
    if [ -f /var/lib/pacman/db.lck ]
    then
        rm -rf /var/lib/pacman/db.lck
    fi
    echo ""
    echo -e "${yellow}[+] ${green}Updating system & installing sudo ${white}"
    while ! pacman -Syu sudo --noconfirm --needed ; do
        echo -e "${red}[-] Failed to update and installing sudo. Retrying...${white}"
        sleep 2
    done
    for i in wget curl fish neofetch git base-devel
    do
        if [ -f /var/lib/pacman/db.lck ]
        then
            rm -rf /var/lib/pacman/db.lck
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
blackarchMirror() {
    sleep 1
    banner
    clear
    echo -e "${green}[+] Adding blackarch mirror-list ${white}"
    curl -O https://blackarch.org/strap.sh
    echo "26849980b35a42e6e192c6d9ed8c46f0d6d06047  strap.sh" | sha1sum -c
    chmod +x strap.sh
    sudo ./strap.sh
    sudo pacman -Syu
    clear
}
usradd(){
    echo -e "${cyan}"
    read -p "[+] enter username (lowercase) : " user
    echo -e "${red}"
    read -p "[+] enter password (lowercase) : " pass
    echo -e ""
    sudo useradd -m -s $(which bash) ${user}
    sudo usermod -aG wheel ${user}
    echo "${user}:${pass}" | sudo chpasswd
    echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
}
usr(){
    banner
    echo -e "${yellow}"
    usradd #user add function
    touch blackarch
    echo "#! /bin/bash" >> blackarch
    echo "termux-x11 :1 &" >> blackarch
    echo "proot-distro login archlinux --shared-tmp --user ${user}" >> blackarch
    chmod 777 blackarch && mv blackarch /data/data/com.termux/files/usr/bin
    echo "clear && neofetch && fish" >> /home/$user/.bashrc
    mv desktop.sh /home/$user

    sleep 5

}

note(){
    banner
    echo -e "${yellow}[+] ${green}Arch Linux installed successfully with a regular user"
    echo ""
    echo -e "${yellow}[+] ${green}exit termux and type ${cyan}blackarch"
    echo ""
    echo -e "${yellow}[+] ${green}run ${cyan}bash desktop.sh ${green}to install gui"
    echo ""
}

banner
confrim
pkgInstaller
addpkginstaller
blackarchMirror
usr
note
