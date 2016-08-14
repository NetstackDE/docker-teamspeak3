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

#check Files and copy them if exists
if [ -f /data/licensekey.dat ]
then
  echo "Found LicenseKey and copy it to TS3 dir ...";
  cp /data/licensekey.dat /home/ts3/teamspeak3-server_linux_amd64/
fi
if [ -f /data/query_ip_blacklist.txt ]
then
  echo "Found BlacklistFile! Copy it to TS3 dir ...";
  cp /data/query_ip_blacklist.txt /home/ts3/teamspeak3-server_linux_amd64/
fi
if [ -f /data/query_ip_whitelist.txt ]
then
  echo "Found WhitelistFile! Copy it to TS3 dir ...";
  cp /data/query_ip_whitelist.txt /home/ts3/teamspeak3-server_linux_amd64/
fi

#check if there is a files directory and copy it to the Server directory
if [ -d /data/files ]
then
  echo "Found files Directory ! Copy it to TS3 dir ...";
  cp -Rf /data/files /home/ts3/teamspeak3-server_linux_amd64/
fi

/home/ts3/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh
