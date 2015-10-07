# Quickstart Brightspot using Vagrant

This is a quick way to get up and running with Brightspot locally using Vagrant.

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

[Java 8 Web download](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

```
$ brew install maven 
```
[Maven web download](https://maven.apache.org/download.cgi)
```
$ brew cask install virtualbox
```
[VirtualBox web download](https://www.virtualbox.org/wiki/Downloads)
```
$ brew cask install vagrant
```
[Vagrant web download](https://www.vagrantup.com/downloads.html)
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

Navigate back to the Root (where the VagrantFile is) and run `vagrant up` to start the project locally:

```
$ vagrant up
```

Once completed, access Brightspot at [http://localhost:8080/cms](http://localhost:8080/cms)


### Get Started

Open the `Project` maven project in any text editor or IDE and create a new Java class within the `java/com/project` directory:

```
package com.project;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import java.util.*;
import com.psddev.cms.db.*;

public class HelloWorld extends Content {

	private String helloWorld;

	public String getHelloWorld(){
		return helloWorld;
	}
	
	public void setHelloWorld(String helloWorld){
		this.helloWorld = helloWorld;
	}
  
}
```

Navigate to Brightspot and run `http://localhost:8080/cms?_reload=true` to reload the application. You should see the prompt to install the reloader.

Click into Search and in the Create drop-down find the `HelloWorld` content type.  

### Shutdown

To stop, run `vagrant halt`

### Restart

To restart the application after a shutdown, run `vagrant up` then `vagrant ssh` to log into vagrant. From there navigate to tomcat and start it.

`sudo /home/vagrant/tomcat/bin/startup.sh`

### New Deploy

The reloader will manage the deployment of new code to the application, but sometimes when a config change is made (pom.xml for example) you need to remove the ROOT.war in the tomcat and redeploy a new war file.

- Compile the project to create a new war file by running `mvn clean install` in the project dir.
- Run `vagrant up`
- Make sure tomcat is not running
- Navigate to the webapps dir of tomcat `$ cd /home/vagrant/tomcat/` and run `sudo rm -rf ROOT ROOT.war` to remove the old war file and dir.
- Run `$ sudo cp /vagrant/project/target/*.war ROOT.war` to copy the new war file from the project into the vagrant tomcat.
- Start tomcat `$ sudo /home/vagrant/tomcat/bin/startup.sh`


### Notes

- Nothing should be running on port 8080 when you run `vagrant up`
- To change the database name or password modify it within the bootstrap.sh and context.xml


