sudo apt-get update
sudo apt-get -y install nginx

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

sudo cp artifacts/newman--ssl_ba_rproxy /etc/nginx/sites-available/newman
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/newman /etc/nginx/sites-enabled/newman

sudo mkdir -p /var/www/newman/
sudo chown -R vagrant:vagrant /var/www/newman



RED='\033[0;31m'
NC='\033[0m'

echo "========================================================================================"
echo -e "${RED}Add users to .htpasswd file using the following two commands:${NC}"
echo "sudo sh -c \"echo -n 'vagrant:' >> /etc/nginx/.htpasswd\""
echo "sudo sh -c \"openssl passwd -apr1 >> /etc/nginx/.htpasswd\""
echo "...repeat for each user"
echo "========================================================================================"


#  Add users to .htpasswd will prompt for passwd
#  e.g. vagrant users / pass
#  sudo sh -c "echo -n 'vagrant:' >> /etc/nginx/.htpasswd"
#  sudo sh -c "openssl passwd -apr1 >> /etc/nginx/.htpasswd"
#  ...repeat
#



