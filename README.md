# docker-node

Sample docker project that uses [passenger-docker](https://github.com/phusion/passenger-docker)
as a base to create an image with a node application

Clone this repo

Generate keys

```shell
$ openssl genrsa -out privatekey.pem 1024
$ chmod 600 privatekey.pem
$ ssh-keygen -f privatekey.pem -y > publickey.ssh
`````

If behind a proxy enable proxy in docker.
In Ubuntu, edit /etc/default/docker and add
```shell
export http_proxy="http://yourProxyHost:yourProxyPort"
`````

Build new image, run it and test it

```shell
$ sudo docker build -t luafran/passenger-node .
$ sudo docker images
$ sudo docker run -p 27000:80 -d --name passenger-node luafran/passenger-node
$ sudo docker ps
$ sudo docker inspect <container_id> | grep -i ipaddress
$ curl http://localhost:27000
$ ssh -i privatekey.pem root@<container_ip>
`````
