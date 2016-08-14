#/bin/bash

#debug
echo TeamspeakURL: ${TEAMSPEAK_DOWNLOAD_URL}

#get TEAMSPEAK SERVER and extract
wget -O /home/ts3/teamspeak3-server_linux_amd64.tar.bz2 ${TEAMSPEAK_DOWNLOAD_URL}
tar --directory /home/ts3 -xjf /home/ts3/teamspeak3-server_linux_amd64.tar.bz2

#remove archive
rm /home/ts3/teamspeak3-server_linux_amd64.tar.bz2

#check License File and copy it if exists 
if [ -f /data/licensekey.dat ]
then
  cp /data/licensekey.dat /home/ts3/teamspeak3-server_linux_amd64/
fi

/home/ts3/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh
