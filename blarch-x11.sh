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
    echo -e "${blue}"
    echo "________________________________________________________________"
    echo ""
}

pkgInstall(){
        echo -e "${yellow}[+] ${green}updating system${white}"
        echo ""
        pkg update -y
        echo -e "${yellow}[+] ${green}installing x11-repo${white}"
        echo ""
        pkg install x11-repo -y
        for i in proot-distro wget
        do
                echo -e "${yellow}[+] ${green}checking $i installed or not ${white}"
                echo ""
                sleep 2
                if command -v $i > /dev/null 2>&1
                then
                        echo -e "${yellow}[+] ${green}$i is installed ${white}"
                        echo ""
                else
                        echo -e "${yellow}[+] ${green}installing $i ${white}"
                        echo ""
                        pkg install $i -y
                fi
        done
        sleep 2
        echo -e "${yellow}[+] ${green}checking termux-x11 installed or not ${white}"
        echo ""
        sleep 2
        if command -v termux-x11 > /dev/null 2>&1
        then
                echo -e "${yellow}[+] ${green}termux-x11 is installed ${white}"
                echo ""
        else
                echo -e "${yellow}[+] ${green}installing termux-x11${white}"
                echo ""
                pkg install termux-x11-nightly -y
        fi
        sleep 2
}

distroInstaller(){
        echo -e "${yellow}[+] ${green}checking archlinux installed or not ${white}"
        echo ""
        sleep 2
        if [ -d /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux ]
        then
                echo -e "${yellow}[+] ${green}archlinux is installed ${white}"
                echo ""
                sleep 2
        else
        echo -e "${yellow}[+] ${green}installing archlinux on your system${white}"
        echo ""
        sleep 2
        pd i archlinux
        fi
        if [ -d /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root ]
        then
                sleep 3
        else
                echo -e "${red}[+] failed to install archlinux${white}"
                exit 1
        fi
}

allowExternal(){
        echo -e "${yellow}[+] ${green}enabeling termux external view${white}"
        sleep 2
        echo "allow-external-apps = true" >> ../.termux/termux.properties
        sleep 4

}

pacmanConf(){
	echo -e "${yellow}[+] ${green}Configuring pacman${white}"
	rm -rf /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/etc/pacman.conf
	wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/pacman.conf -O /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/etc/pacman.conf
	chmod 444 /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/etc/pacman.conf
}

bashConf(){
	echo -e "${yellow}[+] ${green}Configuring bashrc${white}"
	rm -rf /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/etc/bash.bashrc
	wget https://raw.githubusercontent.com/BlackArch/blackarch-config-bash/master/bashrc -O /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/etc/bash.bashrc
	chmod 644 /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/etc/bash.bashrc

}

notice(){
        touch blackarch
	chmod 777 blackarch
        echo "#! /bin/bash" >> blackarch
        echo "" >> blackarch
        echo "clear && pd sh archlinux --shared-tmp" >> blackarch
        chmod 777 * && chmod 777 blackarch
        mv blackarch /data/data/com.termux/files/usr/bin
        cp -a useradd.sh desktop.sh /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/archlinux/root
	chmod 777 /data/data/com.termux/files/usr/bin/blackarch
        echo -e "${cyan}>>> start your archlinux by typing ${green}blackarch"
	echo ""
        echo -e "${cyan}>>> after starting archlinux then type ${green}bash useradd.sh${green}"
	echo ""
}

#_______________________

banner
pkgInstall
distroInstaller
pacmanConf
bashConf
allowExternal
banner
notice
