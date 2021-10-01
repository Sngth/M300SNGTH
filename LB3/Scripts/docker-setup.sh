sudo apt-get update
sudo apt-get install -y docker.io           # das sind 360 MB
sudo docker pull nginx
sudo docker run -d --name nginx-server -p 8011:80 nginx
sudo docker pull mysql
sudo docker run -d --name mysql-server -p 8012:80 mysql
sudo docker pull wordpress
sudo docker run -d --name wordpress-server -p 8013:80 wordpress
sudo docker pull nextcloud
sudo docker run -d --name nextcloud-server -p 8014:80 nextcloud
sudo docker pull phpmyadmin
sudo docker run -d --name phpmyadmin-server -p 8015:80 phpmyadmin
sudo docker pull plesk/plesk
sudo docker run -d --name plesk-server -p 8016:80 plesk/plesk
