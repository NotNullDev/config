#!/bin/bash

# openssl verify -CAfile RootCert.pem -untrusted Intermediate.pem UserCert.pem
# NAME=$1 
# pass=$2 # passphrase (min length 6)


# if [ $# -ne 2 ]
# then
#     echo wtf
#     exit 1
# fi

sha=sha256
days=8600

rootName="root"

# optional (to create certificate for web)
NAME=gitlab.example.com
IP=10.174.12.22
pass=xdxdxdxd

# create root (ignore if exists, fill correctly $rootName.key)

# openssl genrsa -passout pass:$pass -des3 -out $rootName.key 2048 

# openssl req -x509 -new -nodes \
# -key $rootName.key \
# -$sha -days $days \
# -subj "/CN=OK/O=NANA/C=PL/OU=$rootName" \
# -passin pass:$pass \
# -passout pass:$pass \
# -out $rootName.cer 

# create domain cert
>$NAME.config cat <<-EOF
[ req ]
default_bits       = 4096
distinguished_name = req_distinguished_name
req_extensions     = req_ext

[ req_distinguished_name ]
OU=$NAME
C=PL
O=Krajowa Izba Rozliczeniowa S.A
CN=SZAFIR Trusted CA

[ req_ext ]
subjectAltName = @alt_names

[alt_names]
DNS.1   = $NAME
DNS.2   = www.$NAME # you can add more domain names and ip below
IP.1    = $IP
EOF

echo create private key
openssl genrsa -passout pass:$pass -des3 -out $NAME.key 2048 

echo create csr
openssl req -passin pass:$pass -new -$sha -key $NAME.key -subj "/C=PL/O=Krajowa Izba Rozliczeniowa S.A/CN=SZAFIR Trusted CA/OU=$NAME" -out $NAME.csr

# sign agent cert
echo sign agent cert
openssl x509 -req -in $NAME.csr -CA $rootName.cer -CAkey $rootName.key -CAcreateserial -out $NAME.cer -days $days -$sha -passin pass:$pass \
-extensions req_ext -extfile ./$NAME.config

# verify domain
echo verify domain
openssl verify -CAfile root.cer -verify_hostname $NAME $NAME.cer || exit

# create keystore
echo "Creating keystore"
openssl pkcs12 \
-passin pass:$pass \
-export -chain -CAfile $rootName.cer \
-in $NAME.cer -inkey $NAME.key \
-out $NAME.keystore -passout pass:$pass \
-name $NAME

if [ -f $NAME.jks ]
then
    rm $NAME.jks
fi

convert to java keystore
keytool -importkeystore \
-srcstorepass $pass -srckeystore $NAME.keystore -srcstoretype pkcs12 \
-srcalias "$NAME" \
-destkeystore $NAME.jks \
-deststoretype jks -deststorepass $pass -destalias ""