#!/bin/bash

source ~/.nvm/nvm.sh

cd /wetty/
node app.js -p $WETTY_PORT &

echo "the wind is blowing at http://localhost:$WETTY_PORT"

wrapdocker
