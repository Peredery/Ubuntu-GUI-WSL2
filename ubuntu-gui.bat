@echo off
echo Ubuntu starting...
start "" /B x410.exe /wm /public > nul
start "" /B "c:\wsl\pulseaudio-1.1\bin\pulseaudio.exe" --use-pid-file=false -D > nul
wsl -d ubuntu-gui run "if [ -z \"$(pidof plasmashell)\" ]; then cd ~ ; export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 ; setxkbmap us,ru -option grp:ctrl_shift_toggle ; export LIBGL_ALWAYS_INDIRECT=1 ; export PULSE_SERVER=tcp:$(grep nameserver /etc/resolv.conf | awk '{print $2}') ; sudo /etc/init.d/dbus start &> /dev/null ; sudo service ssh start ; sudo service xrdp start ; plasmashell & latte-dock ; pkill '(gpg|ssh)-agent' ; fi;"
taskkill.exe /F /T /IM x410.exe > nul
taskkill.exe /F /IM pulseaudio.exe > nul
