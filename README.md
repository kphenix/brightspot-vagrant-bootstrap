# brightspot-vagrant-bootstrap

This is a quick way to get up and running with Brightspot using Virtual Box and Vagrant.

### Installation

```
$ brew cask install java
```

```
$ brew install maven 
```

```
$ brew cask install virtualbox
```

```
$ brew cask install vagrant
```

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

Navigate back to the R vagrant to start the project locally:

```
$ vagrant up
```

Once completed, access Brightspot at [http://localhost:8080/cms](http://localhost:8080/cms)





