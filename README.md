# brightspot-vagrant-bootstrap

This is a quick way to get up and running with Brightspot using Vagrant.

It requires:

- Java 8
- Maven 3
- Virtual Box
- Vagrant


### Installation

Homebrew can be used to install all requirements, otherwise go to each website and download:

```
$ brew cask install java
```

[Web Download](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

```
$ brew install maven 
```
[Web Download](https://maven.apache.org/download.cgi)
```
$ brew cask install virtualbox
```
[Web Download](https://www.virtualbox.org/wiki/Downloads)
```
$ brew cask install vagrant
```
[Web Download](https://www.vagrantup.com/downloads.html)
```
$ git clone https://github.com/kphenix/brightspot-vagrant-bootstrap.git
```

Navigate into the new repository:

```
$ cd brightspot-vagrant-bootstrap/project
```

Run maven to compile the project and create the war file:

```
$ mvn clean install
```

Navigate back to the Root and run `vagrant up` t to start the project locally:

```
$ vagrant up
```

Once completed, access Brightspot at [http://localhost:8080/cms](http://localhost:8080/cms)





