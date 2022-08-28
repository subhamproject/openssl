#!/bin/bash

#https://www.golinuxcloud.com/openssl-generate-csr-create-san-certificate/

cat << EOF > server_cert_ext.cnf
basicConstraints = CA:FALSE
nsCertType = server
nsComment = "OpenSSL Generated Server Certificate"
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer:always
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
IP.1 = 10.10.10.13
IP.2 = 10.10.10.14
IP.3 = 10.10.10.17
IP.4 = 192.168.43.104
DNS.1 = centos8-3.example.com
EOF


openssl genrsa -out server.key.pem 4096 


openssl req -new -key server.key.pem -out server.csr

openssl x509 -req -in server.csr -passin file:mypass.enc -CA /root/tls/intermediate/certs/ca-chain-bundle.cert.pem -CAkey /root/tls/intermediate/private/intermediate.cakey.pem -out server.cert.pem -CAcreateserial -days 365 -sha256 -extfile server_cert_ext.cnf


openssl x509  -noout -text -in server.cert.pem


curl --key client.key.pem  --cert client.cert.pem --cacert /root/tls/intermediate/certs/ca-chain-bundle.cert.pem  https://10.10.10.17:8443 -v
