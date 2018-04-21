sed -i s/myport/\&PORT/g /config.json
python server.py -c /config.json > /dev/null
