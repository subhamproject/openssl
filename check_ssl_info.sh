#!/bin/bash

CERT_NAME=$1

[ -z $CERT_NAME ] && { echo "Please provide cert name to check details for? and try again" ; exit 1 ; }

echo "Checking Cert $CERT_NAME details - following are the details"

echo "--------------------------------------------------------------------------"


echo "Cert $CERT_NAME subjectAltName Name:"
openssl x509 -in $CERT_NAME -noout -ext subjectAltName

echo "--------------------------------------------------------------------------"

echo "Cert Autohorityinfo Access $CERT_NAME"
openssl x509 -in $CERT_NAME -noout -ext authorityInfoAccess,crlDistributionPoints

echo "--------------------------------------------------------------------------"


echo "Cert Expiry dates details $CERT_NAME"
openssl x509 -in $CERT_NAME -noout -dates

echo "--------------------------------------------------------------------------"


echo "Cert Subject of issuers $CERT_NAME"
openssl x509 -in $CERT_NAME -noout -issuer -subject

echo "--------------------------------------------------------------------------"


echo "Cert Start Date $CERT_NAME"
openssl x509 -in $CERT_NAME -noout -startdate

echo "--------------------------------------------------------------------------"


echo "Cert End Date $CERT_NAME"
openssl x509 -in $CERT_NAME -noout -enddate

echo "--------------------------------------------------------------------------"


echo "Cert Serial number $CERT_NAME"
openssl x509 -in $CERT_NAME -noout -serial

echo "--------------------------------------------------------------------------"


echo "Cert PublicKey $CERT_NAME"
openssl x509 -in $CERT_NAME -noout -pubkey

echo "--------------------------------------------------------------------------"


echo "Cert modulus Details $CERT_NAME"
openssl x509 -in $CERT_NAME -noout -modulus
