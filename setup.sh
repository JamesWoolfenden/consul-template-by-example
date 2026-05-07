#!/usr/bin/env bash
set -euo pipefail

# https://releases.hashicorp.com/consul-template/
version="0.39.1"
archive="consul-template_${version}_linux_amd64.zip"
base="https://releases.hashicorp.com/consul-template/${version}"

sudo apt-get update
sudo apt-get install -y unzip wget

tmpdir=$(mktemp -d)
trap 'rm -rf -- "$tmpdir"' EXIT
cd "$tmpdir"

wget -q "${base}/${archive}"
wget -q "${base}/consul-template_${version}_SHA256SUMS"
grep "$archive" "consul-template_${version}_SHA256SUMS" | sha256sum -c -

unzip -o "$archive"
sudo install -m 0755 consul-template /usr/local/bin/consul-template

consul-template --version
