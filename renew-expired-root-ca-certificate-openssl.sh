#!/bin/bash

#https://www.golinuxcloud.com/renew-expired-root-ca-certificate-openssl/


openssl verify -CAfile orig-cacert.pem -verbose server.crt

date --set "19 Mar 2022 14:59:00"


openssl verify -CAfile orig-cacert.pem -verbose server.crt


openssl x509 -x509toreq -in orig-cacert.pem -signkey orig-ca.key -out new-server.csr


openssl x509 -req -days 365 -in new-server.csr -signkey orig-ca.key -out new-cacert.pem


openssl verify -CAfile new-cacert.pem -verbose server.crt

sha256sum orig-cacert.pem

sha256sum new-cacert.pem

openssl x509 -noout -text -in orig-cacert.pem

openssl x509 -noout -text -in new-cacert.pem

# the signature of both the CA certificates are the same.


