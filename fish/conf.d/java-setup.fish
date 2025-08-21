#!/usr/bin/env fish
echo 'Loading java-setup.fish'

# Java related bits
# To set up these versions they need to be installed in these locations
# `sudo apt install openjdk-"X"-jdk`
# You can use `sudo update-alternatives --config java` to select defaults
set JAVA_8 /usr/lib/jvm/java-8-openjdk-amd64
set JAVA_11 /usr/lib/jvm/java-11-openjdk-amd64
set JAVA_17 /usr/lib/jvm/java-17-openjdk-amd64
set JAVA_21 /usr/lib/jvm/java-21-openjdk-amd64

# Java
set JAVA_HOME $JAVA_21
set STUDIO_JDK $JAVA_21
set JDK_HOME $JAVA_21
set PATH $JAVA_HOME/bin $PATH

# Following https://medium.com/@vpriyanshu671/how-to-install-apache-maven-of-version-3-9-8-on-ubuntu-d47cf536db04
# latest version wget https://downloads.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.tar.gz
# On WSL you may need to clear out any links to windows versions of MVN from $PATH
set M2_HOME /opt/maven/bin
set PATH $M2_HOME $PATH
