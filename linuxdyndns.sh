#!/bin/bash
#You can start this script at startup by adding to crontab
#@reboot sh /path/to/linuxdyndns.sh
#e.g. host in.ter.com
HOST=<INSERT HOST>
#e.g. HOST=in
DOMAIN=<INSERT DOMAIN>
#e.g. DOMAIN=ter.com
PASSWORD=<INSERT PASSWORD>
#e.g. PASSWORD=1234567890abcdef1234567890abcdef
INTERVAL=<INSERT INTERVAL>
#e.g. If you want
#every 01 minute: INTERVAL=1
#every 15 minute: INTERVAL=15

while true
do
        curl "https://dynamicdns.park-your-domain.com/update?host=$HOST&domain=$DOMAIN&password=$PASSWORD&ip=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com|awk -F'"' '{print $2}')"
        sleep $(($INTERVAL*60))
done
