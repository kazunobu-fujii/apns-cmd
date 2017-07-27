#!/bin/sh
curl -v --http2 --cert ${pem} -H "apns-priority: ${priority}" -H "apns-expiration: ${expiration}" -H "apns-topic: ${topic}" -d "$1" -L "${url}${token}"
