sudo apt update
sudo apt install apache2 -y
sudo ufw allow 'Apache'
sudo systemctl enable apache2
sudo systemctl start apache2
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests