#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
content=$(curl http://169.254.169.254/latest/meta-data/local-ipv4);echo "<h1>$content</h1>" | sudo tee /var/www/html/index.html
