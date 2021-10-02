M300 - LB3 Dokumentation
===================

# Inhaltsverzeichnis
-[LB3](#LB3)
 - [Lerndokumentation](#Lerndokumentation)
    - [22 September 2021](#22-September-2021)
 - [Notizen](#Notizen)
 - [Dokumentation](#Dokumentation)
    - [Sicherheitsaspekte](#Sicherheitsaspekte)
    - [Technische Angaben](#Technische-Angaben)
    - [VMS](#VMS)
    - [Test](#Test)
    - [Reflexion](#Reflexion)
- [Version History](#Version-History)

## LB3

### Lerndokumentation
***

#### 22 September 2021
***
Heute haben wir mit dem Modul 300 angefangen. Wir haben unser Gerät mit den nötigsten Softwares installiert. 
Diese Tools haben wir installiert:

* Docker

Wir haben heute Docker kennengelernt.

##### Probleme
* Heute gab es keine Probleme

#### Mein Wissenstand
##### Linux
* Linux kannte ich bereits schon von den vergangenen Modulen. Verwende es auch teilweise im Betrieb für Fehlerbehebungen im Netz oder im Bereich Dateien.

##### Virtualisierung
* Wir haben in der Schule und im ÜK viel mit Virtualisierung gemacht. Im Betrieb verwenden wir auch eine Virtualisierungsumgebung

##### Vagrant
* Mit den Vorlagen vom Lehrer habe ich mal Vagrant ausprobiert.
* Vagrant neu kennengelernt -Vagrantfile erstellt und editiert -Vagrant init/up/destroy -f

##### Git
* Git kannte ich bereits schon von den vergangenen Modulen
* Repository erstellt mit einem Readme.md

##### Docker
* Mit Docker habe ich einmal gearbeitet, aber nie so genau geschaut.


## Notizen
***
#### Vagrant-Befehle
Usage: vagrant [optionen] <Befehl> [<args>]

Mit dem Befehl "vagrant list-commands" werden alle Befehle aufgeführt:

|Befehl          |Bedeutung
|:---------------|:---------------------------------------------------------------|
|autocomplete    |manages autocomplete installation on host                       |
|box             |manages boxes: installation, removal, etc.                      |
|cap             |checks and executes capability                                  |
|cloud           |manages everything related to Vagrant Cloud
|destroy         |stops and deletes all traces of the vagrant machine
|docker-exec     |attach to an already-running docker container
|docker-logs     |outputs the logs from the Docker container
|docker-run      |run a one-off command in the context of a container
|halt            |stops the vagrant machine
|help            |shows the help for a subcommand
|init            |initializes a new Vagrant environment by creating a Vagrantfile
|list-commands   |outputs all available Vagrant subcommands, even non-primary ones
|login           |
|package         |packages a running vagrant environment into a box
|plugin          |manages plugins: install, uninstall, update, etc.
|port            |displays information about guest port mappings
|powershell      |connects to machine via powershell remoting
|provider        |show provider for this environment
|provision       |provisions the vagrant machine 
|rdp             |connects to machine via RDP
|reload          |restarts vagrant machine, loads new Vagrantfile configuration
|resume          |resume a suspended vagrant machine
|rsync           |syncs rsync synced folders to remote machine
|rsync-auto      |syncs rsync synced folders automatically when files change
|snapshot        |manages snapshots: saving, restoring, etc.
|ssh             |connects to machine via SSH
|ssh-config      |outputs OpenSSH valid configuration to connect to the machine
|suspend         |suspends the machine
|up              |starts and provisions the vagrant environment
|upload          |upload to machine via communicator
|validate        |validates the Vagrantfile
|winrm           |executes commands on a machine via WinRM
|winrm-config    |outputs WinRM configuration to connect to the machine

### Tips
- `vagrant -v`                    -- get the vagrant version
- `vagrant status`                -- outputs status of the vagrant machine
- `vagrant global-status`         -- outputs status of all vagrant machines
- `vagrant global-status --prune` -- same as above, but prunes invalid entries
- `vagrant provision --debug`     -- use the debug flag to increase the verbosity of the output
- `vagrant push`                  -- yes, vagrant can be configured to [deploy code](http://docs.vagrantup.com/v2/push/index.html)!
- `vagrant up --provision | tee provision.log`  -- Runs `vagrant up`, forces provisioning and logs all output to a file

### Plugins
- [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) : `$ vagrant plugin install vagrant-hostsupdater` to update your `/etc/hosts` file automatically each time you start/stop your vagrant box.

##### Docker-Befehle

### Show commands & management commands

```
$ docker
```

### Docker version info

```
$ docker version
```

### Show info like number of containers, etc

```
$ docker info
```

# WORKING WITH CONTAINERS

### Create an run a container in foreground

```
$ docker container run -it -p 80:80 nginx
```

### Create an run a container in background

```
$ docker container run -d -p 80:80 nginx
```

### Shorthand

```
$ docker container run -d -p 80:80 nginx
```

### Naming Containers

```
$ docker container run -d -p 80:80 --name nginx-server nginx
```

### TIP: WHAT RUN DID

- Looked for image called nginx in image cache
- If not found in cache, it looks to the default image repo on Dockerhub
- Pulled it down (latest version), stored in the image cache
- Started it in a new container
- We specified to take port 80- on the host and forward to port 80 on the container
- We could do "$ docker container run --publish 8000:80 --detach nginx" to use port 8000
- We can specify versions like "nginx:1.09"

### List running containers

```
$ docker container ls
```

OR

```
$ docker ps
```

### List all containers (Even if not running)

```
$ docker container ls -a
```

### Stop container

```
$ docker container stop [ID]
```

### Stop all running containers

```
$ docker stop $(docker ps -aq)
```

### Remove container (Can not remove running containers, must stop first)

```
$ docker container rm [ID]
```

### To remove a running container use force(-f)

```
$ docker container rm -f [ID]
```

### Remove multiple containers

```
$ docker container rm [ID] [ID] [ID]
```

### Remove all containers

```
$ docker rm $(docker ps -aq)
```

### Get logs (Use name or ID)

```
$ docker container logs [NAME]
```

### List processes running in container

```
$ docker container top [NAME]
```

#### TIP: ABOUT CONTAINERS

Docker containers are often compared to virtual machines but they are actually just processes running on your host os. In Windows/Mac, Docker runs in a mini-VM so to see the processes youll need to connect directly to that. On Linux however you can run "ps aux" and see the processes directly

# IMAGE COMMANDS

### List the images we have pulled

```
$ docker image ls
```

### We can also just pull down images

```
$ docker pull [IMAGE]
```

### Remove image

```
$ docker image rm [IMAGE]
```

### Remove all images

```
$ docker rmi $(docker images -a -q)
```

#### TIP: ABOUT IMAGES

- Images are app bianaries and dependencies with meta data about the image data and how to run the image
- Images are no a complete OS. No kernel, kernel modules (drivers)
- Host provides the kernel, big difference between VM

### Some sample container creation

NGINX:

```
$ docker container run -d -p 80:80 --name nginx nginx (-p 80:80 is optional as it runs on 80 by default)
```

APACHE:

```
$ docker container run -d -p 8080:80 --name apache httpd
```

MONGODB:

```
$ docker container run -d -p 27017:27017 --name mongo mongo
```

MYSQL:

```
$ docker container run -d -p 3306:3306 --name mysql --env MYSQL_ROOT_PASSWORD=123456 mysql
```

## CONTAINER INFO

### View info on container

```
$ docker container inspect [NAME]
```

### Specific property (--format)

```
$ docker container inspect --format '{{ .NetworkSettings.IPAddress }}' [NAME]
```

### Performance stats (cpu, mem, network, disk, etc)

```
$ docker container stats [NAME]
```

## ACCESSING CONTAINERS

### Create new nginx container and bash into

```
$ docker container run -it --name [NAME] nginx bash
```

- i = interactive Keep STDIN open if not attached
- t = tty - Open prompt

**For Git Bash, use "winpty"**

```
$ winpty docker container run -it --name [NAME] nginx bash
```

### Run/Create Ubuntu container

```
$ docker container run -it --name ubuntu ubuntu
```

**(no bash because ubuntu uses bash by default)**

### You can also make it so when you exit the container does not stay by using the -rm flag

```
$ docker container run --rm -it --name [NAME] ubuntu
```

### Access an already created container, start with -ai

```
$ docker container start -ai ubuntu
```

### Use exec to edit config, etc

```
$ docker container exec -it mysql bash
```

### Alpine is a very small Linux distro good for docker

```
$ docker container run -it alpine sh
```

(use sh because it does not include bash)
(alpine uses apk for its package manager - can install bash if you want)

# NETWORKING

### "bridge" or "docker0" is the default network

### Get port

```
$ docker container port [NAME]
```

### List networks

```
$ docker network ls
```

### Inspect network

```
$ docker network inspect [NETWORK_NAME]
("bridge" is default)
```

### Create network

```
$ docker network create [NETWORK_NAME]
```

### Create container on network

```
$ docker container run -d --name [NAME] --network [NETWORK_NAME] nginx
```

### Connect existing container to network

```
$ docker network connect [NETWORK_NAME] [CONTAINER_NAME]
```

### Disconnect container from network

```
$ docker network disconnect [NETWORK_NAME] [CONTAINER_NAME]
```

### Detach network from container

```
$ docker network disconnect
```

# IMAGE TAGGING & PUSHING TO DOCKERHUB

# tags are labels that point ot an image ID

```
$ docker image ls
```

Youll see that each image has a tag

### Retag existing image

```
$ docker image tag nginx btraversy/nginx
```

### Upload to dockerhub

```
$ docker image push bradtraversy/nginx
```

### If denied, do

```
$ docker login
```

### Add tag to new image

```
$ docker image tag bradtraversy/nginx bradtraversy/nginx:testing
```

### DOCKERFILE PARTS

- FROM - The os used. Common is alpine, debian, ubuntu
- ENV - Environment variables
- RUN - Run commands/shell scripts, etc
- EXPOSE - Ports to expose
- CMD - Final command run when you launch a new container from image
- WORKDIR - Sets working directory (also could use 'RUN cd /some/path')
- COPY # Copies files from host to container

### Build image from dockerfile (reponame can be whatever)

### From the same directory as Dockerfile

```
$ docker image build -t [REPONAME] .
```

#### TIP: CACHE & ORDER

- If you re-run the build, it will be quick because everythging is cached.
- If you change one line and re-run, that line and everything after will not be cached
- Keep things that change the most toward the bottom of the Dockerfile

# EXTENDING DOCKERFILE

### Custom Dockerfile for html paqge with nginx

```
FROM nginx:latest # Extends nginx so everything included in that image is included here
WORKDIR /usr/share/nginx/html
COPY index.html index.html
```

### Build image from Dockerfile

```
$ docker image build -t nginx-website
```

### Running it

```
$ docker container run -p 80:80 --rm nginx-website
```

### Tag and push to Dockerhub

```
$ docker image tag nginx-website:latest btraversy/nginx-website:latest
```

```
$ docker image push bradtraversy/nginx-website
```

# VOLUMES

### Volume - Makes special location outside of container UFS. Used for databases

### Bind Mount -Link container path to host path

### Check volumes

```
$ docker volume ls
```

### Cleanup unused volumes

```
$ docker volume prune
```

### Pull down mysql image to test

```
$ docker pull mysql
```

### Inspect and see volume

```
$ docker image inspect mysql
```

### Run container

```
$ docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True mysql
```

### Inspect and see volume in container

```
$ docker container inspect mysql
```

#### TIP: Mounts

- You will also see the volume under mounts
- Container gets its own uniqe location on the host to store that data
- Source: xxx is where it lives on the host

### Check volumes

```
$ docker volume ls
```

**There is no way to tell volumes apart for instance with 2 mysql containers, so we used named volumes**

### Named volumes (Add -v command)(the name here is mysql-db which could be anything)

```
$ docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql
```

### Inspect new named volume

```
docker volume inspect mysql-db
```

# BIND MOUNTS

- Can not use in Dockerfile, specified at run time (uses -v as well)
- ... run -v /Users/brad/stuff:/path/container (mac/linux)
- ... run -v //c/Users/brad/stuff:/path/container (windows)

**TIP: Instead of typing out local path, for working directory use $(pwd):/path/container - On windows may not work unless you are in your users folder**

### Run and be able to edit index.html file (local dir should have the Dockerfile and the index.html)

```
$ docker container run  -p 80:80 -v $(pwd):/usr/share/nginx/html nginx
```

### Go into the container and check

```
$ docker container exec -it nginx bash
$ cd /usr/share/nginx/html
$ ls -al
```

### You could create a file in the container and it will exiost on the host as well

```
$ touch test.txt
```

# DOCKER COMPOSE

- Configure relationships between containers
- Save our docker container run settings in easy to read file
- 2 Parts: YAML File (docker.compose.yml) + CLI tool (docker-compose)

### 1. docker.compose.yml - Describes solutions for

- containers
- networks
- volumes

### 2. docker-compose CLI - used for local dev/test automation with YAML files

### Sample compose file (From Bret Fishers course)

```
version: '2'

# same as
# docker run -p 80:4000 -v $(pwd):/site bretfisher/jekyll-serve

services:
  jekyll:
    image: bretfisher/jekyll-serve
    volumes:
      - .:/site
    ports:
      - '80:4000'
```

### To run

```
docker-compose up
```

### You can run in background with

```
docker-compose up -d
```

### To cleanup

```
docker-compose down
```

## Dokumentation
***

### Netzwerkplan
***
![Netzwerkplan]()

Die IPs werden automatisch und statisch vergeben sodass kein Konflikt besteht falls eine IP verwendet wird, wird die IP nicht verwendet.

### Sicherheitsaspekte
***
* Server mit den neusten Sicherheitspatches installiert
* Systeme Passwortgeschützt
* UFW Firewall aktivieren
* Zugang nur via SSH

#### Updates
```
    $ sudo apt update && sudo apt upgrade -y
    $ sudo apt autoremove -y
```

#### LDAP
Während der Installation wird die LDAPSeite durch User und Passwort geschützt.

#### Apache Webserver
Nach der Apache Installation wird noch ein Reverse Proxy für den Webserver installiert
```
    $ sudo a2enmod proxy
    $ sudo a2enmod proxy_http
    $ sudo a2enmod proxy_balancer
    $ sudo a2enmod lbmethod_byrequests
```

#### MySQL
Mit MySql Secure Installation schützt die Datenbank und der User wird mit einem Passwort geschützt

#### PHPMyadmin
Während der Installation wird die PHPSeite durch User und Passwort geschützt.

#### Firewall
| Server | Firewall Rules |
|:-:|-|
| ubuntu-ldap | sudo ufw allow 'Apache'<br>sudo ufw allow 80/tcp<br>sudo ufw allow 22/tcp<br>sudo ufw default deny incoming<br>sudo ufw default allow outgoing |
| ubuntu-xx | sudo ufw allow 'Apache'<br>sudo ufw allow 22/tcp<br>sudo ufw default deny incoming<br>sudo ufw default allow outgoing |

#### Zugriff via SSH tunnel
Sobald die VMs eingerichtet sind (`vagrant up`), sind sie über:
```shell
    vagrant ssh ubuntu-ldap
    vagrant ssh ubuntu-xx
```

#### Fail2Ban installiert
fail2ban ist ein Set aus Client, Server und Konfigurationsdateien, welches Logdateien überwacht, dort nach vordefinierten Mustern sucht und nach diesen temporär IP-Adressen sperrt. Ziel des Programms ist, alle Serverdienste gegen Angriffe des Typs Denial of Service (DoS) abzusichern.
```
    $sudo apt-get install fail2ban -y
```

### Technische Angaben
***

### VMS
| Server | Aufgbae |
|:-:|-|
| ubuntu-ldap | LDAP Server |
| ubuntu-xx | Apache, Mysql und Phpmyadmin server |

### Test
***
 Nr. | Beschreibung | Kontrollie | Soll-Situation | Ist-Situation | Bestanden? |
|:-:|-|-|-|-|:-:|
| 1 | `ubuntu-1` sollte ubuntu-ldap pingen | ping 192.168.100.10  | ping funktioniert| ping funktioniert | Y |
| 2 | `ubuntu-1` PhPmyadmin funktioniert? via IP Zugriff | http://192.168.100.11/phpmyadmin/ | Zugriff erfolgreich | Zugriff erfolgreich | Y |
| 3 | `ubuntu-2` Apache Server funktioniert? via IP Zugriff | http://192.168.100.12 | Zugriff erfolgreich | Zugriff erfolgreich | Y |
| 4 | `ubuntu-2` Apache Server funktioniert? via Port Zugriff | http://localhost:8012/ | Zugriff erfolgreich | Zugriff erfolgreich | Y |
| 5 | `ubuntu-ldap` Zugriff SSH | vagrant ssh ubuntu-ldap | Zugriff erfolgreich | Zugriff erfolgreich | Y |
| 6 | `ubuntu-ldap` Zugriff phpldapadmin | http://192.168.100.10/phpldapadmin/ | Zugriff erfolgreich | Zugriff erfolgreich | Y |
| 7 | `ubuntu-1` Create Database via mysql shell | vagrant ssh<br>mysql -uroot -proot<br>create databse rocket<br>show databases; | Datenbank erstellt | Datenbank erstellt | Y |
| 8 | `ubuntu-1` Create Database via phpmyadmin  | http://192.168.100.10/phpmyadmin/ | Datenbank erstellt | Datenbank erstellt | Y |


### Reflexion
***
Vor diesem Projekt hatte ich noch nie etwas von Vagrant gehört, es war sehr neu für mich. Am Anfang hatte ich ein bisschen Mühe, alles zu verarbeiten, aber nach ein paar Mal hatte ich den Dreh raus. Am Anfang habe ich die Dokumentation etwas vernachlässigt oder besser gesagt vergessen.In der Dokumentation habe ich einen Spickzettel für Befehle gemacht, damit ich ein bisschen den Überblick habe, was welcher Befehl macht. 

Am Anfang wollte ich ein Projekt mit Windows machen leider funktionierte es nicht so wie gewollt. Nach dieses Fehlschlägen habe ich mich für ein Projekt mit Linux entschieden, was ich auch im Endeffekt auch im Betrieb demnächst benutzen kann für ein kommendes Projekt.

Beim arbeiten dieses Projektes habe ich fast nie mit Git bash gearbeitet nur mit VS, Virtualbox und Github Desktop, der Vorteil beim VS Code man kann alles in einem machen ich konnte im VS einen Terminal aufmachen und dort die Befehle ausführen oder die Dateien ins Respository pushen.

Beim Lernfortschritt habe ich sehr vieles in Vagrant gelernt, aber bei Linux und Co habe ich fast nichts neues kennengelernt, da ich sehr vieles schon durch die anderen Module und Lehrbetrieb kannte.

### GitHub README.md:

#### Authors

Contributors names and contact info

Sangeeth Sivakumaran

#### Version History
* [History](https://github.com/Sngth/M300SNGTH/blob/main/Readme.md)

#### Acknowledgments

Inspiration, code snippets, etc.
* [Source](https://github.com/mc-b/M300)