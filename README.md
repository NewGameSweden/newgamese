New Game website
======
This is the new website for https://newgame.se

It uses rails 4.2

## Setup
```bash


#Download and install virtualbox version 4.3
#https://www.virtualbox.org/wiki/Download_Old_Builds_4_3


vagrant plugin install vagrant-vbguest vagrant-librarian-chef
vagrant up
vagrant ssh

#Install programs in the vagrant environment
export PATH=$PATH:"/home/vagrant/.rbenv/versions/2.1.2/bin/"
sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev libmysqlclient-dev mysql-server redis-server

#Install gems
cd /vagrant
gem install bundler
rbenv rehash
bundle install

#fetch file from Kevin
vim config/secrets.yml
#NOTICE: make sure to use 2 whitespaces, not tab.

#Prepare database
rake db:setup
rake rails:update:bin
rbenv rehash

#Start server
rails s -b 0.0.0.0

```
Reach the server by navigating to [localhost](http://localhost:3000)

## Let’s encrypt
In order to setup https for the server we need to install the Let’s encypt client and run it.
````bash
sudo apt-get update
sudo apt-get install git

#Clone the repository to /opt/letsencrypt/ and navigate to it

sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
cd /opt/letsencrypt

#Run letsencrypt-auto with the apche plugin, where example.com is the domain you want your certificate to be valid for (you can #specify multiple domains here, by adding another -d)

./letsencrypt-auto --apache -d example.com
````
Access to the server over https:443 should now work.
A certificate is valid for 90 days. The following command will renew your certificate if it is close to expiry.
````bash
./letsencrypt-auto renew

# A cronjob could look like this
30 2 * * 1 /opt/letsencrypt/letsencrypt-auto renew >> /var/log/le-renew.log
````

##Deploy 
This needs to be filled the next time we deploy the server

Environment variables, such as API keys, has to be set in /etc/apache2/envvars otherwise they will not be visible 
to the rails server
