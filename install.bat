@echo off
wsl --set-default-version 2
cls
echo Insstalling Ubuntu-GUI...
wsl --import Ubuntu-GUI c:\wsl c:\wsl\ubuntu-gui
wsl -s Ubuntu-GUI
cls
echo Done.
pause