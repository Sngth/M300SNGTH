sudo apt update
sudo apt install -y docker.io           # das sind 360 MB
sudo git clone https://github.com/Sngth/M300SNGTH.git
cd M300SNGTH
cd LB3/docker/apache
docker build -t app .
docker run -d -p 8011:80 -v /data/server/app:/var/www/site/app --name app app