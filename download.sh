#!/bin/sh
#
# Download the boot2docker package
#

echo 'Downloading boot2docker package...'

cd /tmp
curl -O http://files.kalamuna.com/boot2docker-macosx-1.1.1.pkg

echo 'Done!'
