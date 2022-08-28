#!/bin/bash

openssl req -text -noout -verify -in server.csr

openssl rsa -in server.key -check

openssl rsa -text -in yourdomain.key -noout

openssl x509 -in server.crt -text -noout

openssl req -text -in yourdomain.csr -noout –verify
