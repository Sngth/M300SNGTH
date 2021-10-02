sudo apt update
sudo apt install -y docker.io           # das sind 360 MB
sudo git clone https://github.com/Sngth/M300SNGTH.git
cd M300SNGTH
cd LB3/docker/apache
sudo docker build -t apache .
sudo docker run --rm -d -p 8011:80 -v `pwd`/web:/var/www/html --name apache apache