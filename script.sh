#!/bin/bash
echo "[Wait] Control internet connection..."

wget -q --tries=10 --timeout=15 --spider http://google.com
if [[ $? -eq 0 ]]; then
        echo -e "Connected!\n\nUpdate before proceeding..."
        echo -e "[!] If required, enter the password to proceed\nWait..."
        sudo apt-get --assume-yes update > /dev/null

        echo "[Check] Deepin file manager..."

        control="dde-file-manager"

        if dde="$(type -p "$control")" || ! [ -z "$dde" ]; 
        then
  			echo -e "Deepin file manager installed.\n\n[Wait] Uninstalling...\n";
  			echo -e "[!] If required, enter the password to proceed with uninstallation\nWait..."
  			
  			sudo apt-get --assume-yes --purge remove $control > /dev/null

  			echo -e "Deepin file manager uninstalled!\n\n"
  		else
			echo -e "Deepin file manager not installed.\n\n";
		fi

		echo "[Check] Nautilus file manager..."
  		control="nautilus"	

  		if dde="$(type -p "$control")" || ! [ -z "$dde" ]; 
        then
        	echo "Nautilus is already installed"
  		else
  			echo -e "Proceed to install Nautilus file manager\n"
  			echo -e "[!] If required, enter the password to proceed with installation\nWait..."
  			sudo apt-get --assume-yes install nautilus > /dev/null
  		fi
  		
  		echo -e "\n\nScript finished...\n"
else
        echo -e "You're offline, check your internet connection!\n\nScript finished...\n"
fi


