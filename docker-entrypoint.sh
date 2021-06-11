#!/bin/bash

gzip -d < outputfile.gz | (cd /; tar xpkf - ./etc) 2>/dev/null && rm outputfile.gz #populate /etc/postfix
mkdir /etc/postfix/dynamicmaps.cf.d #postfix is very keen on having that dir...
mkdir /etc/postfix/postfix-files.d #...and that
postfix set-permissions #duh, permissions

#start da stuff
postfix start-fg