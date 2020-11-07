#!/bin/bash

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

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

cd $1/Windows/System32 
rm osk.exe 
mv bsdk.exe osk.exe 

echo "Patch done !"