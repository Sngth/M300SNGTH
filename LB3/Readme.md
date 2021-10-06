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

Wir haben heute Docker kennengelernt. Wir haben die Einführung zu Docker und die Verwendung von Docker gezeigt bekommen. Nach der Einführung haben wir docker getestet. weiter Docker habe ich im Betrieb mal gebraucht, habe aber nie mit Dockerfiles oder Compose Files gearbeitet.

##### Probleme
* Heute gab es keine Probleme.

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
* Mit Docker habe ich einmal gearbeitet, aber nie so genau geschaut. Wir haben im Betrieb mit Docker für Webserver verwendet.


## Notizen
***

### Docker-Befehle
Die Verwendung von docker besteht darin, eine Kette von Optionen und Befehlen zu übergeben, gefolgt von Argumenten. Die Syntax übernimmt diese Form:
```
$ docker [option] [command] [arguments]
```
Um alle verfügbaren Unterbefehle zu sehen, geben Sie Folgendes ein:
```
$ docker
```

|Befehl          |Bedeutung
|:---------------|:---------------------------------------------------------------|
|attach            |Attach local standard input, output, and error streams to a running container|
|build             |Build an image from a Dockerfile|
|commit            |Create a new image from a container's changes|
cp                |Copy files/folders between a container and the local filesystem
create            |Create a new container
diff              |Inspect changes to files or directories on a container's filesystem
events            |Get real time events from the server
exec              |Run a command in a running container
export            |Export a container's filesystem as a tar archive
history           |Show the history of an image
images            ||List images
import            |Import the contents from a tarball to create a filesystem image
info              |Display system-wide information
inspect           |Return low-level information on Docker objects
kill              |Kill one or more running containers
load              |Load an image from a tar archive or STDIN
login             |Log in to a Docker registry
logout            |Log out from a Docker registry
logs              |Fetch the logs of a container
pause             |Pause all processes within one or more containers
port              |List port mappings or a specific mapping for the container
ps                |List containers
pull              |Pull an image or a repository from a registry
push              |Push an image or a repository to a registry
rename            |Rename a container
restart           |Restart one or more containers
rm                |Remove one or more containers
rmi               |Remove one or more images
run               |Run a command in a new container
save              |Save one or more images to a tar archive (streamed to STDOUT by default)
search            |Search the Docker Hub for images
start             |Start one or more stopped containers
stats             |Display a live stream of container(s) resource usage statistics
stop              |Stop one or more running containers
tag               |Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
top               |Display the running processes of a container
unpause           |Unpause all processes within one or more containers
update            |Update configuration of one or more containers
version           |Show the Docker version information
wait              |Block until one or more containers stop, then print their exit codes

#### Weitere Befehle
##### Alle Images entfernen
```
$ docker rmi $(docker images -a -q)
$ docker rm $(docker ps -a -f status=exited -q)
```

## Dokumentation
***

### Netzwerkplan
***
![Netzwerkplan]()

### Sicherheitsaspekte
***

#### Nextcloud-Proxy 
Nach der Nextcloud Installation wird noch ein Reverse Proxy für den Webserver installiert
```
<IfModule mod_ssl.c>
<VirtualHost *:443>
        #  General setup for the virtual host
        DocumentRoot "/var/www"
        ServerName my-nextcloud.sngth.net
        ServerAdmin webmaster@sngth.ch
        ErrorLog /var/log/apache2/my-nextcloud.sngth.ch_error.log
        TransferLog /var/log/apache2/my-nextcloud.sngth.ch_access.log

        Include /etc/apache2/dstk-all-sites-incl.conf

        # see https://doc.owncloud.org/server/8.1/admin_manual/configuration_server/harden_server.html
        Header always add Strict-Transport-Security "max-age=15768000"

        # RewriteLogLevel 3

        RewriteEngine On
        ProxyRequests Off

        ProxyPass        / http://nextcloud.sngth.ch:8094/
        ProxyPassReverse / http://nextcloud.sngth.ch:8094/

        SSLCertificateFile /etc/letsencrypt/live/my-nextcloud.sngth.ch/fullchain.pem
        SSLCertificateKeyFile /etc/letsencrypt/live/my-nextcloud.sngth.ch/privkey.pem
        Include /etc/letsencrypt/options-ssl-apache.conf
</VirtualHost>
</IfModule>
```
### Technische Angaben
***
### VMS
| Server | Aufgabe |
|:-:|-|
| nextcloud-1 | Nextcloud mit DB, Webserver|
| nextcloud-2 | Nextcloud mit DB, Webserver, Https, Proxy und Backup |

### Test
***
 Nr. | Beschreibung | Kontrollie | Soll-Situation | Ist-Situation | Bestanden? |
|:-:|-|-|-|-|:-:|
| 1 | `nextcloud-1`  | Zugang via IP  | http://192.168.100.11:8080/ | Zugriff erfolgreich | Zugriff erfolgreich | Y |
| 2 | `nextcloud-2` Zugang via IP? ohne DNS Eintrag | http://192.168.100.11:8094/ | Zugriff fehlgeschlagen | Zugriff fehlgeschlagen | Y |
| 3 | `nextcloud-1` Einrichtung ohne Https? | http://192.168.100.12 | Einrichtung erfolgreich | Einrichtung erfolgreich | Y |
| 4 | `nextcloud-2` Zugang via IP? mit DNS Eintrag | http://nextcloud.sngth.ch:8094/ | Zugriff erfolgreich | Zugriff erfolgreich | Y |
| 5 | `nextcloud-2` Einrichtung ohne Https? | http://192.168.100.11:8094/ | Zugriff fehlgeschlagen | Zugriff fehlgeschlagen | Y |

### Reflexion
***
Ich kannte Docker, aber habe nur  Am Anfang hatte ich ein bisschen Mühe, alles zu verarbeiten, aber nach ein paar Mal hatte ich den Dreh raus. Am Anfang habe ich die Dokumentation etwas vernachlässigt oder besser gesagt vergessen. In der Dokumentation habe ich einen Spickzettel für Befehle gemacht, damit ich ein bisschen den Überblick habe, was welcher Befehl macht. 

Beim arbeiten dieses Projektes habe ich fast nie mit Git bash gearbeitet nur mit VS, Virtualbox und Github Desktop, der Vorteil beim VS Code man kann alles in einem machen ich konnte im VS einen Terminal aufmachen und dort die Befehle ausführen oder die Dateien ins Respository pushen.

Beim Lernfortschritt habe ich sehr vieles über Docker gelernt, aber bei Linux und Co habe ich fast nichts neues kennengelernt, da ich sehr vieles schon durch die anderen Module und Lehrbetrieb kannte.

Die Idee war das wir das Nextcloud für unser Startup gut gebrauch können, da wir momentan noch mit der Cloud der TBZ arbeiten.

### GitHub README.md:

#### Authors

Contributors names and contact info

Sangeeth Sivakumaran

#### Version History
* [History](https://github.com/Sngth/M300SNGTH/blob/main/Readme.md)

#### Acknowledgments

Inspiration, code snippets, etc.
* [Source](https://github.com/mc-b/M300)