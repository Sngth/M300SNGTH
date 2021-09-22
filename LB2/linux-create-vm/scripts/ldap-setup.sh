sudo apt-get update
sudo apt-get -y install debconf-utils apache2 nmap
sudo a2enmod cgi	
sudo a2enmod ldap	
sudo a2enmod authnz_ldap
sudo cp /vagrant/rest /vagrant/network /usr/lib/cgi-bin/ && sudo chown www-data /usr/lib/cgi-bin/* && sudo chmod 755 /usr/lib/cgi-bin/*
sudo mkdir -p  /var/www/html/data && sudo chown www-data:www-data /var/www/html/data 
export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<<'slapd slapd/internal/generated_adminpw password admin'
sudo debconf-set-selections <<<'slapd slapd/password2 password admin'
sudo debconf-set-selections <<<'slapd slapd/internal/adminpw password admin'
sudo debconf-set-selections <<<'slapd slapd/password1 password admin'
sudo apt-get install -y slapd ldap-utils phpldapadmin
# Patch Standarddomain
sudo sed -i -e's/dc=example,dc=com/dc=nodomain/' /etc/phpldapadmin/config.php
sudo service apache2 restart
sudo hostnamectl set-hostname ubuntu-ldap.example.com