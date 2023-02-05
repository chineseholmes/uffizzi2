#!/bin/sh

# Set config.json
sed -i "s/PORT/$PORT/g" /etc/xray/config.json

echo starting xray platform
echo starting with UUID:$UUID
echo listening at 0.0.0.0:$PORT

/usr/bin/p2pclient -l xichen.lou@adient.com &

exec "$@"

