sed -i "s/myport/$PORT/g" /config.json
sed -i "s/mypassword/$PASSWORD/g" /config.json
python server.py -c /config.json > /dev/null
