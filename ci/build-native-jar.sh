#!/usr/bin/env bash
set -e

export GRAALVM_HOME=/opt/graalvm

# Install Maven
yum install -y wget
wget https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P /tmp
tar xf /tmp/apache-maven-3.6.0-bin.tar.gz -C /opt
ln -s /opt/apache-maven-3.6.0 /opt/maven
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}

cd src-repo
mvn package -Pnative -B -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn
cp target/*-runner ../target/
