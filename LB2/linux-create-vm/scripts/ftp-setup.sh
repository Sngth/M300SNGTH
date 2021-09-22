sudo apt-get update
#FTP Server installieren
sudo apt-get -y install pure-ftpd-common pure-ftpd
#FTP Server konfigurieren
sudo groupadd ftpgroup
sudo useradd -g ftpgroup -d /dev/null -s /etc ftpuser
sudo pure-pw useradd sngth -u ftpuser -g ftpgroup -d /home/pubftp/sngth -N 10
#FTP Server neustarten
#sudo service pure-ftpd-common pure-ftpd restart
sudo /home/pubftp/sngth restart
#Tastaturlayout anpassen
sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="ch"/g' /etc/default/locale
#Local Firewall installieren
sudo apt-get -y install ufw gufw 
sudo ufw --force enable