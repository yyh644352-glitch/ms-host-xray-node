#!/bin/sh
sed -i 's/"port":[0-9]*/"port": '"${PORT:-3000}"'/' /usr/local/etc/xray/config.json
exec /usr/local/bin/xray -config /usr/local/etc/xray/config.json
