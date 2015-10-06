#!/usr/bin/env bash

apt-get update
debconf-set-selections <<< 'mysql-server mysql-server/root_password password 123abc'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 123abc'
apt-get update
apt-get install -y mysql-server

sudo apt-get install maven

sudo apt-get install -y software-properties-common python-software-properties
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default

wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.14/bin/apache-tomcat-8.0.14.tar.gz
tar xvzf apache-tomcat-8.0.14.tar.gz
rm -rf apache-tomcat-8.0.14.tar.gz
mv apache-tomcat-8.0.14 tomcat
sudo cp /vagrant/configs/context.xml /home/vagrant/tomcat/conf/context.xml

sudo apt-get install zip unzip

wget https://www.dropbox.com/s/2lxck8z0epk5j1c/solr.zip
unzip solr.zip
sudo cp -r /home/vagrant/solr/solr tomcat/solr
sudo cp /home/vagrant/solr/solr.war /home/vagrant/tomcat/webapps/solr.war 
sudo cp /home/vagrant/solr/lib/*.jar /home/vagrant/tomcat/lib

sudo mkdir /home/vagrant/tomcat/webapps/media-items
sudo rm -rf /home/vagrant/tomcat/webapps/ROOT

sudo cp /vagrant/project/target/*.war /home/vagrant/tomcat/webapps/ROOT.war
cd tomcat
echo "CREATE DATABASE IF NOT EXISTS brightspotDatabase" | mysql -uroot -p123abc
sudo ./bin/startup.sh


