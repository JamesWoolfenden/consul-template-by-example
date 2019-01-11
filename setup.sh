#!/bin/bash
set -e
apt-get install unzip
consulversion="0.19.5"
cd /usr/local/bin
echo "wget https://releases.hashicorp.com/consul-template/$consulversion/consul-template_${consulversion}_linux_amd64.zip"
wget "https://releases.hashicorp.com/consul-template/$consulversion/consul-template_${consulversion}_linux_amd64.zip"
unzip ./*.zip
rm ./*.zip
