sudo apt update
sudo apt install -y docker.io           # das sind 360 MB
sudo git clone https://github.com/Sngth/M300SNGTH.git
cd M300SNGTH
cd LB3/docker/nginx
sudo docker run -d -p 8011:80 dockerfile/nginx
