#!/bin/bash

wrapdocker

cd /wetty/
node app.js -p $WETTY_PORT
