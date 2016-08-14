# Teamspeak3 Docker Image

this image will download, install and start a Teamspek3 Server. You can specify the Download URL or use the default one.
You can also use a Docker Volume as data storage or mount a host directory.

* Notes & limits
  * Will only work with **Teamspeak Server 64bit** Version !
  * Based on Ubuntu 16:04 image


You can mount a Directory or Docker Volume Container with license file and other stuff.
Possible content of the directory (example: /path/to/test-data ):

  * test-data/
    * licensekey.dat
    * ts3server.sqlitedb
    * files/
      * virtualserver_1
        * internal
          * icons
    * query_ip_blacklist.txt
    * query_ip_whitelist.txt

**Note:** The Files Directory have to be a backup from another Teamspeak Server as this have to follow a special directory structure.  

## Example RUN COMMANDS

Start Teamspeak Server without any custom data

```bash
docker run --name teamspeak-server -p 9987:9987/udp -p10011:10011 -p30033:30033 -d netstack/docker-teamspeak3:latest
```

Start Teamspeak Server with a specific TeamSpeak Version

```bash
docker run --name teamspeak-server -p 9987:9987/udp -p10011:10011 -p30033:30033 -e TEAMSPEAK_DOWNLOAD_URL=http://dl.4players.de/ts/releases/3.0.12/teamspeak3-server_linux_amd64-3.0.12.tar.bz2 -d netstack/docker-teamspeak3:latest
```

Start Teamspeak Server with custom data (mount test-data dir from host)

```bash
docker run --name teamspeak-server -p 9987:9987/udp -p10011:10011 -p30033:30033 -v/path/to/test-data:/data -d netstack/docker-teamspeak3:latest
```

Start Teamspeak Server with custom data (mount test-data Docker Volume )

```bash
docker run --name teamspeak-server -p 9987:9987/udp -p10011:10011 -p30033:30033 -vtest-data:/data -d netstack/docker-teamspeak3:latest
```
