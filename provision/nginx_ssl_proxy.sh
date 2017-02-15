sudo apt-get update
sudo apt-get install nginx


cd /etc/nginx
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

sudo cp artifacts/newman--https_rproxy /etc/nginx/sites-available/newman
sudo rm /etc/nginx/sites-available/default
sudo ln -s /etc/nginx/sites-available/newman /etc/nginx/sites-enable/newman

sudo mkdir -p /var/www/newman/
sudo chown -R vagrant:vagrant /var/www/newman


