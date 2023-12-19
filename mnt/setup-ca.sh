#!/usr/bin/env bash

apt-get install -y apt-transport-https ca-certificates

echo "Install self-signed CA-s"

self_signed_dir="/usr/share/ca-certificates/self-signed"
for file in "$self_signed_dir"/*.crt; do
    my_crt="self-signed/$(basename "$file")"
    echo "$my_crt" >> /etc/ca-certificates.conf
done
update-ca-certificates --fresh --verbose
