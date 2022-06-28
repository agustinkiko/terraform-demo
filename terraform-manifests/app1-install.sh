#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
# sudo apt update -y
# sudo yum install -y httpd
# sudo systemctl enable httpd
# sudo service httpd start  
# sudo echo '<h1>Welcome to StackSimplify - APP-1</h1>' | sudo tee /var/www/html/index.html
# sudo mkdir /var/www/html/app1
# sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - APP-1</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
# sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html


sudo wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
echo "deb http://nginx.org/packages/ubuntu focal nginx" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/ubuntu focal nginx" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install nginx
sudo systemctl start nginx.service
sudo systemctl status nginx.service

mkdir public_html
sudo echo '<h1>Welcome to StackSimplify - APP-1</h1>' | sudo tee public_html/app1/app1.html
mkdir -p data/images
curl -o data/images/NGINX-logo.png https://www.nginx.com/wp-content/uploads/2021/11/NGINX-logo-2020.png
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o public_html/app1/metadata.html
sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak
sudo cp server1.conf /etc/nginx/conf.d/server1.conf
sudo nginx -s reload