#!/bin/bash
# Defcon26SecureWifiConf
set -x

YOUR_USERNAME=$1
YOUR_PASSWORD=$2
wget https://wifireg.defcon.org/digicertca.crt

openssl x509 -in digicertca.crt -out /etc/ssl/certs/digicertca.pem -outform PEM

cp 
/etc/wpa_supplicant.conf /etc/wpa_supplicant.conf_old 

echo 'network={
ssid="DefCon"
captive_check=0
boost_flags=0
key_mgmt=WPA-EAP IEEE8021X
eap=PEAP
identity="$YOUR_USERNAME"
password="$YOUR_PASSWORD"
ca_cert="/etc/ssl/certs/digicertca.pem"
phase2="auth=MSCHAPV2"
proactive_key_caching=0
}
' > /etc/wpa_supplicant.conf
