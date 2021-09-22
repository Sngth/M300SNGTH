M300 - 00 Personelles
===================
Auf diesem Folder findet man meine Fortschritte, Dokumentation und Ergbnisse
# Inhaltsverzeichnis
- [Lerndokumentation](#Lerndokumentation)
  - [25.August.2021](#25-August-2021)
  - [08.September.2021](#08-September-2021)
- [Notizen](#Notizen)
- [Dokumentation](#Dokumentation)
    - [Sicherheitsaspekte](#Sicherheitsaspekte)
    - [Technische Angaben](#Technische-Angaben)
    - [VMS](#VMS)
    - [Test](#Test)
    - [Reflexion](#Reflexion)
    - [Version History](#Version-History)

### Lerndokumentation
***

#### 25 August 2021
***
Heute haben wir mit dem Modul 300 angefangen. Wir haben unser Gerät mit den nötigsten Softwares installiert. 
Diese Tools haben wir installiert:
* GitHub 
* Git Client
* VirtualBox
* Vagrant
* Visual Studio Code

Wir haben hier mit Vagrant gearbeitet, was für mich etwas Neues ist, da ich noch nie mit diesem Tool gearbeitet habe. Was sehr angenehm ist, ist dass man eine oder mehrere VMs per Skript automatisch erstellen kann, was sehr komfortabel ist. Da ich manchmal mehrere VMs mit der gleichen Konfiguration erstellen muss, ist das Modul eine Hilfe für mich, um Dinge zu automatisieren. Desöfteren habe ich Probleme mit Virtualbox er löscht die VM aber er löscht Sie nicht und wenn man diese löschen möchte muss man zuerst den PC neustarten was sehr mühsam war.

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

#### 08 September 2021
***
Heute habe ich weiter an meinem Vagrantfile gearbeitet. Am Anfang wollte ich ein Projekt mit Windows machen leider klappte es nicht so wie gewollt, da ich sehr viele Probleme hatte, aber nachher endschied ich mich für Linux da es viel besser und eifacher lauft zum Sachen automatisieren

Ich habe es geschafft, mehrere VMs mit einer Schleife zu erstellen und externe SH-Skripte zuzuweisen. IP werden auch automatisch über die Nummer erstellt und ich kann auf das System entweder über localhost:port oder auch über die zugewiesene IP zugreifen. Nachher habe ich noch einen LDAP Server im Script implementiert.

##### Probleme
* Vagrant gab beim Starten eine Menge Fehlermeldungen aus. Durch ein Forum konnte ich das Problem beheben und weiterarbeiten. Desöfteren habe ich Probleme mit Virtualbox er löscht die VM aber er löscht Sie nicht und wenn man diese löschen möchte muss man zuerst den PC neustarten was sehr mühsam war. 

#### Mein Wissenstand
##### Linux
* -

##### Virtualisierung
* -

##### Vagrant
* Mehrere Vms mit Loop erstellen
* Datenbank erstellen
* Für die automatische Konfiguration von VirtualBox Guest Additions installieren `vagrant-vbguest`:<br>`vagrant plugin install vagrant-vbguest`

##### Git
* -

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

## Dokumentation
***

### Netzwerkplan
***
![Netzwerkplan](https://github.com/Sngth/M300SNGTH/blob/main/assets/Bilder/Netzwerkplan.png?raw=true)

Die IPs werden automatisch und statisch vergeben sodass kein Konflikt besteht falls eine IP verwendet wird, wird die IP nicht verwendet.

### Sicherheitsaspekte
***
* Server mit den neusten Sicherheitspatches installiert
* Systeme Passwortgeschützt
* UFW Firewall aktivieren
* Zugang nur via SSH

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
#### Updates
./scripts/vm-update.sh

Bevor Tools installiert werden ihm diese commands:   
```
    $ sudo apt update && sudo apt upgrade -y
    $ sudo apt autoremove -y
```

#### Apache Webserver
./scripts/apache-setup.sh

Nach dem Update wir Apache installiert:   
```
    $ sudo apt update
    $ sudo apt install apache2 -y
    $ sudo ufw allow 'Apache'
    $ sudo systemctl enable apache2
    $ sudo systemctl start apache2
```

#### Mysql Setup
./scripts/mysql-setup.sh

#### Phpmyadmin
./scripts/phpmyadmin-setup.sh
```
    $ sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
    $ sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/setup-password password test'
    $ sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password test'
    $ sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/password-confirm password test'
    $ sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'
    $ sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password test'
    $ sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password test'
    $ sudo apt-get -y install phpmyadmin
```

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

Beim arbeiten dieses Projektes habe ich fast nie mit Git bash gearbeitet nur mit VS, Virtualbox und Github Desktop, der Vorteil beim VS Code man kann alles in einem machen ich konnte im VS einen Terminal aufmachen und dort die Befehle ausführen oder die Daten ins Respository pushen.

Beim Lernfortschritt habe ich sehr vieles in Vagrant gelernt, aber bei Linux und Co habe ich fast nichts neues kennengelernt, da ich sehr vieles schon durch die anderen Module und Lehrbetrieb kannte.

### GitHub README.md:

#### Authors

Contributors names and contact info

Sangeeth Sivakumaran

#### Version History
* 0.6
    * Readme.md add content
    * Vagrantfile adjust
    * Gitignore adjust
    * SH Scripts created and adjust
* 0.7
    * Readme.md add content
    * Vagrantfile adjust
    * Gitignore adjust
    * SH Scripts created
* 0.6
    * Readme.md add content
    * OLD.txt file created for testing
    * Vagrantfile adjust
    * Gitignore adjust
* 0.5
    * Readme.md add content
    * Vagrantfile adjust
    * Gitignore adjust
* 0.4
    * Readme.md add content
    * Vagrantfile edited
    * Gitignore created
* 0.3
    * Folders created
    * Readme.md add content
    * Vagrantfile edited
* 0.2
    * added README-md file
    * added commands to Vagrantfile
    * Vagrantfiles created
* 0.1
    * Initial Release
    * M300 Forked
    * Ordner 00-Personelles erstellt

#### Acknowledgments

Inspiration, code snippets, etc.
* [Source](https://github.com/mc-b/M300)