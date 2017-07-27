# APNs command

APNs one-liner command

## Usage

```
$ docker run --rm -it -v $(pwd):/run --entrypoint /bin/ash --env-file .env kazunobufujii/curl-http2 exec.sh '{"aps": {"alert": "test", "sound": "default", "badge": 1}}'
```

## How to make PEM (key.pem)

1. prepare certificates

* aps.cer
* app.p12

2. generate key.pem

```
$ openssl x509 -in aps.cer -inform DER -out aps.pem -outform PEM
$ openssl pkcs12 -out app.pem -in app.p12 -nocerts 
$ openssl rsa -in app.pem -out app_pub.pem
$ cat aps.pem app_pub.pem > key.pem
```

## Customize

```
$ docker run --rm -it -v $(pwd):/run --entrypoint /bin/ash --env-file .env -e token=[device token] -e topic=[bundleID] kazunobufujii/curl-http2 exec.sh '{"aps": {"alert": "test", "sound": "default", "badge": 1}}'
```

refs: `.env`

