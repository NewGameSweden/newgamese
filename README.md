 #New Game website

 ##Setup
 vagrant plugin install vagrant-vbguest vagrant-librarian-chef
 vagrant up
 vagrant ssh
 echo "PATH=$PATH:/home/vagrant/.rbenv/versions/2.1.2/bin/"
 
 sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev libmysqlclient-dev mysql-server redis-server
 cd /vagrant
 gem install bundler
 rbenv rehash
 bundle install
 vim config/secrets.yml
 rake db:setup



