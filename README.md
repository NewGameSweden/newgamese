New Game website
======
This is the new website for https://newgame.se

It uses rails 4.2

## Setup
```bash
vagrant plugin install vagrant-vbguest vagrant-librarian-chef
vagrant up
vagrant ssh

#Install programs in the vagrant environment
echo "PATH=$PATH:/home/vagrant/.rbenv/versions/2.1.2/bin/"
sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev libmysqlclient-dev mysql-server redis-server

#Install gems
cd /vagrant
gem install bundler
rbenv rehash
bundle install
vim config/secrets.yml

#Prepare database
rake db:setup
rake rails:update:bin
rbenv rehash

#Start server
rails s -b 0.0.0.0

```
Reach the server by navigating to [localhost](http://localhost:3000)




