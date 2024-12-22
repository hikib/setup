#!/usr/bin/env bash

echo "Removing existing installs..."
[ -d /usr/local/go ] && sudo rm -rf /usr/local/go

echo "Downloading tar file..."
VERSION="1.23.4"
ARCH="amd64"
FILENAME="go${VERSION}.linux-${ARCH}.tar.gz"
curl -O -L "https://golang.org/dl/$FILENAME"

echo "Verifying SHA..."
GOSHA=$(curl -sL https://golang.org/dl/ | grep -A 5 -w "$FILENAME" | tail -n 1 | sed 's/.*<tt>\|<\/tt>.*//g')
MYSHA=$(shasum -a 256 $FILENAME| cut -d' ' -f1)
[ "$MYSHA" != "$GOSHA" ] && echo "shasum failed!" && exit 1

echo "Installing Go..."
sudo tar -C /usr/local -xzf "$FILENAME"
echo "Removing tar file" 
rm "$FILENAME"

echo "Go installed!" 
/usr/local/go/bin/go version

