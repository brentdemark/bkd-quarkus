#!/usr/bin/env bash
set -e

yum update
yum install maven

cd src-repo
mvn package -Pnative
cp target *-runner ../target/
