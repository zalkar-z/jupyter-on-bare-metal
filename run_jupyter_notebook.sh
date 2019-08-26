#!/usr/bin/env bash

DOMAIN=${1?ERROR: No domain name given}

#
# INSTALL NGINX AND REDIRECT ALL REQUESTS ON DOMAIN TO JUPYTER NOTEBOOK
#

sudo apt-get -y update
sudo apt-get -y install nginx

sudo ufw allow 'Nginx Full'

sudo echo "server {
        server_name $DOMAIN;

        location / {
                proxy_pass         'http://127.0.0.1:8888';     
   }
}
" >> /etc/nginx/sites-available/$DOMAIN

sudo ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/

#
# CREATE PYTHON VIRTUAL ENVIRONMENT AND INSTALL JUPYTER
#

sudo apt-get -y upgrade

# install pip package manager
sudo apt-get install -y python3-pip

# install packages for virtual env setup
sudo apt-get install build-essential libssl-dev libffi-dev python3-dev

sudo apt-get install -y python3-venv

mkdir ~/environments
cd ~/environments

pyvenv jupyter-notebook

source jupyter-notebook/bin/activate

python3 -m pip install jupyter


#
# MAKE JUPYTER NOTEBOOK PUBLICLY AVAILABLE
#

# Generate a Jupyter notebook configuration file
jupyter notebook -y --generate-config

# Add the following lines to your config file.
echo "c.NotebookApp.allow_origin = '*'
c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py

#
# INSTALL CERTBOT AND OBTAIN SSL CERT FOR THE DOMAIN
#

# Install Certbot
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get update
sudo apt-get -y install python-certbot-nginx

sudo certbot --nginx -d  $DOMAIN


#
# RESTART NGINX AND START JUPYTER NOTEBOOK
#

sudo systemctl restart nginx
jupyter notebook --allow-root
