# blarch-x11
Arch Linux is a favorite among advanced Linux users for its versatility and minimalism. Now, you can enjoy Arch Linux on your mobile device with Termux-X11, configured to resemble BlackArch, complete with the BlackArch mirror list and a lightweight Fluxbox environment. 💻📱
<br>
Move beyond Kali NetHunter—embrace the power and simplicity of Arch Linux on Termux.
## Screenshots

![App Screenshot](https://i.imgur.com/hK1F7iB.jpg)

![App Screenshot](https://i.imgur.com/vTgM5WR.jpeg)

![App Screenshot]()

## Features

- **Lightweight Installation**: Requires only 3GB - 4GB of space.
- **Sound Support**: Audio issues have been resolved for seamless usage.
- **Penetration Testing Tools**: Optionally install a wide range of BlackArch tools, tailored to your needs.
- **Programming Languages**: Automatically installs highly recommended programming languages of your choice.
- **Penetration testing tools**: Automatically installs highly recommended Penetration testing tools of your choice.
- **VLC Media Player**: Included for all your multimedia playback needs.
- **Fluxbox Environment**: Pre-configured with a BlackArch-inspired setup for a sleek and efficient user experience.
- **Firefox Browser**: Installed for secure and fast web browsing.

## Installation

- Step 1 : Install termux from [Here](https://f-droid.org/repo/com.termux_1020.apk)
- Step 2 : Run following commands 👇👇

```bash
pkg update -y
pkg install git -y
git clone https://github.com/Anon-404/blarch-x11
cd blarch-x11
chmod 777 *
bash blarch-x11.sh
```

- Step 3 : After installing archlinux just run following commands 👇

```bash
blackarch
```
```bash
bash useradd.sh
```

- Step 4 : exit termux

### Note : Now we will install gui on our archlinux

- Step 5 : run step by step

```bash
blackarch 
```
```bash
sudo bash desktop.sh
```
- Step 6 : Install termux-x11 app from [Here](https://github.com/termux/termux-x11/releases/download/nightly/app-universal-debug.apk)

- Step 7 : exit termux then open again and run following commands

```bash
blackarch
```
```bash
x11-start
```
- Step 8 : open termux-x11 app to access desktop environment

#### Note

- To stop x11
```bash
CTRL + C
```

## provided by team Anon404
