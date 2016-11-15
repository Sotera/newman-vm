sudo apt-get update
sudo apt-get install nginx


cd /etc/nginx
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

sudo cp artifacts/newman--https_rproxy /etc/nginx/sites-available/newman
sudo rm /etc/gninx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/newman /etc/nginx/sites-enable/newman

sudo mkdir -p /var/www/newman/
sudo chown -R vagrant:vagrant /var/www/newman


#
#  Add users to .htpasswd will prompt for passwd
#  e.g. vagrant users / pass
#  sudo sh -c "echo -n 'vagrant:' >> /etc/nginx/.htpasswd"
#  sudo sh -c "openssl passwd -apr1 >> /etc/nginx/.htpasswd"
#  ...repeat
#



