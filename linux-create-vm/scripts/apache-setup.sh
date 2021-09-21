sudo apt update
sudo apt install apache2 -y
sudo ufw allow 'Apache'
sudo systemctl enable apache2
sudo systemctl start apache2