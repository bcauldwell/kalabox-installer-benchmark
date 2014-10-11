#!/bin/bash

echo '  : Spinning up boot2docker...'

SCRIPT_DIR=$(pwd)
B2D_DIR=$HOME/.boot2docker
PROFILE_FILE='boot2docker.profile'

if [ ! -d "$B2D_DIR" ]; then
  mkdir -pv "$B2D_DIR"
fi

cp -fv $SCRIPT_DIR/$PROFILE_FILE $B2D_DIR
mv -fv $B2D_DIR/$PROFILE_FILE $B2D_DIR/profile

cd $HOME
echo '  : Initilizing boot2docker...'
boot2docker init
echo '  : Starting boot2docker...'
boot2docker up
