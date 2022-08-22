echo "Starting deployment script run"
sudo apt-get update
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo ln -sf /usr/bin/nodejs /usr/bin/node
sudo npm install && sudo rm -f /etc/nginx/sites-enabled/default
sudo cp test-nginx-config /etc/nginx/sites-available
sudo ln -sf /etc/nginx/sites-available/test-nginx-config /etc/nginx/sites-enabled/test-nginx-config
sudo service nginx restart
sudo npm install -g pm2
sudo pm2 start -f server.js
sudo pm2 startup systemd
sudo pm2 save
echo "End of script run"