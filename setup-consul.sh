#!/usr/bin/env bash
set -euo pipefail

# https://releases.hashicorp.com/consul/
version="1.20.1"
archive="consul_${version}_linux_amd64.zip"
base="https://releases.hashicorp.com/consul/${version}"

sudo apt-get update
sudo apt-get install -y unzip wget

tmpdir=$(mktemp -d)
trap 'rm -rf -- "$tmpdir"' EXIT
cd "$tmpdir"

wget -q "${base}/${archive}"
wget -q "${base}/consul_${version}_SHA256SUMS"
grep "$archive" "consul_${version}_SHA256SUMS" | sha256sum -c -

unzip -o "$archive"
sudo install -m 0755 consul /usr/local/bin/consul

consul version
