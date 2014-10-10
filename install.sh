#!/bin/bash

#
# Install boot2docker package
#

APP_NAME=boot2docker

echo 'Installing boot2docker package...'

# Query the system profiler for installed applications, search for boot2docker
echo "  : Checking to see if $APP_NAME is already installed."
SYS_PROFILER_QUERY=$(system_profiler SPApplicationsDataType | grep -i boot2docker | head -n 1 | grep -io "$APP_NAME")
echo "  : System profiler query result --> [$SYS_PROFILER_QUERY]."

#echo 'WARNING REMOVE!!!!'
#SYS_PROFILER_QUERY='blahblah'

if [ "$SYS_PROFILER_QUERY" == "$APP_NAME" ]; then
  echo "  : $APP_NAME is already installed, exiting!"
  exit 1
else
  echo "  : $APP_NAME is NOT already installed, proceeding..."

  MAC_VOLUME=$(diskutil info / | grep -i 'Volume Name' | awk '{print $3}')
  echo "  : MAC Volume -> [$MAC_VOLUME]."

  /usr/bin/sudo -p "  : Please enter %u's password -->..." installer -pkg /tmp/boot2docker-macosx-1.1.1.pkg -target /Volumes/"$MAC_VOLUME"
  echo "  : $APP_NAME has been installed!"

  exit 0
fi

exit 1;
