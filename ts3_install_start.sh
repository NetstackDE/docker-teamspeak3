#/bin/bash

#debug
echo TeamspeakURL: ${TEAMSPEAK_DOWNLOAD_URL}

#get TEAMSPEAK SERVER and extract
wget -O /home/ts3/teamspeak3-server_linux_amd64.tar.bz2 ${TEAMSPEAK_DOWNLOAD_URL}
tar --directory /home/ts3 -xjf /home/ts3/teamspeak3-server_linux_amd64.tar.bz2

#remove archive
rm /home/ts3/teamspeak3-server_linux_amd64.tar.bz2

#debug
ls -lah /home/ts3

#check Files and link them to the TS3 Server
if [ -f /data/licensekey.dat ]
then
  echo "Found LicenseKey";
  ln -s /data/licensekey.dat /home/ts3/teamspeak3-server_linux_amd64/licensekey.dat
fi
if [ -f /data/query_ip_blacklist.txt ]
then
  echo "Found BlacklistFile";
  ln -s /data/query_ip_blacklist.txt /home/ts3/teamspeak3-server_linux_amd64/query_ip_blacklist.txt
fi
if [ -f /data/query_ip_whitelist.txt ]
then
  echo "Found WhitelistFile";
  ln -s /data/query_ip_whitelist.txt /home/ts3/teamspeak3-server_linux_amd64/query_ip_whitelist.txt
fi
if [ -f /data/ts3server.sqlitedb ]
then
  echo "Found ts3server Database file"
  ln -s /data/ts3server.sqlitedb /home/ts3/teamspeak3-server_linux_amd64/ts3server.sqlitedb
fi


#check if there is a files directory and copy it to the Server directory
if [ -d /data/files ]
then
  echo "Found files Directory ! ";
  ln -s /data/files /home/ts3/teamspeak3-server_linux_amd64/files
fi

/home/ts3/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh
