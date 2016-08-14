# Teamspeak3 Docker Image

this image will download, install and start a Teamspek3 Server. You can specify the Download URL or use the default one.
You can also use a Docker Volume as data storage or mount a host directory.

You can put License file to the Directory to use the License.

```bash
docker run --name teamspeak-server -p 9987:9987/udp -p10011:10011 -p30033:30033 -d teamspeak3-server-test:0.2
```
