#!/bin/bash
apt update ; apt -y install procps wget net-tools iputils-ping traceroute dnsutils

cd /root
curl -s api.ipify.org ; echo
curl -s https://raw.githubusercontent.com/mnlscode/cw/main/claw.tar.gz -o claw.tar.gz ; mkdir -p ./claw ; tar -xzf claw.tar.gz -C ./claw ; rm claw.tar.gz
sed -i -e "s/cftoken/$tk/gi" ./claw/vps.sh
sed -i -e "s/login/bash/gi" ./claw/ttyd.sh
if [ ! -e "./claw/vps.sh" ]; then exit 1 ; fi
sh ./claw/vps.sh &

while true
do
	sleep 10
done
