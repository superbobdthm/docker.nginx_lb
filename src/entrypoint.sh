#!/usr/bin/env bash

#AUTHOR: Douglas Mueller <superbob@dthm.net>

if [ ! -f /etc/letsencrypt/dhparam.pem ]; then
    echo Strong DH parameters not found.
    openssl dhparam -out /etc/letsencrypt/dhparam.pem 2048
fi

# Continue with CMD
exec "$@"