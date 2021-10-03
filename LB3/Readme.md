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

##### Docker-Befehle
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

## Dokumentation
***

### Netzwerkplan
***
![Netzwerkplan]()

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