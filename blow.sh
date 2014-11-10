#!/bin/bash
docker run -it -p 3000:3000 -e PORT=2375 --privileged gesellix/wind
