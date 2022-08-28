#!/bin/bash

openssl s_client -debug -connect other_broker_host:9093 -tls1_2

openssl s_client -debug -connect name-27:9095 -tls1

openssl s_client -debug -connect server2:9092 -tls1
