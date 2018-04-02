#!/bin/bash
set -e
apt-get install unzip
consulversion="1.0.6"
cd /usr/local/bin
echo "wget https://releases.hashicorp.com/consul/$consulversion/consul_${consulversion}_linux_amd64.zip"
wget "https://releases.hashicorp.com/consul/$consulversion/consul_${consulversion}_linux_amd64.zip"
unzip *.zip
rm *.zip
