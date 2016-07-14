#!/usr/bin/env bash

printf "Install \e[0;36mJava JDK 8\e[0m \n"
sudo apt-get -y install oracle-java8-installer

printf "Install \e[0;36mMaven\e[0m \n"
sudo apt-get -y install maven
 
. export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")
echo 'export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")' >> ~/.bashrc
