#!/bin/bash

docker run -it -p 80:80 -p 1935:1935 --name nginx \
       chevylin0802/nginx-bionic /bin/bash /usr/sbin/server.sh



