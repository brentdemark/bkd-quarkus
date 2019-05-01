#!/usr/bin/env bash
set -e

#yum update -y
#yum install -y maven

cd src-repo
mvn package -Pnative
#cp target *-runner ../target/
