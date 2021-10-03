# Install and Configure PHPmyAdmin
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/setup-password password test'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password test'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/password-confirm password test'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password test'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password test'
sudo apt-get -y install phpmyadmin
