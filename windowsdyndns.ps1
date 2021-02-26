#e.g. host in.ter.com
#You can make this script run as a service at the background when computer restart as a service by following using NSSM
#This is a good guide https://xkln.net/blog/running-a-powershell-script-as-a-service/
$SUBDOMAIN="<INSERT HOST>"
#e.g. $SUBDOMAIN="in"
$DOMAIN="<INSERT DOMAIN>"
#e.g. $DOMAIN="ter.com"
$PASSWORD="<INSERT PASSWORD>"
#e.g. $PASSWORD="1234567890abcdef1234567890abcdef"
$INTERVAL=<INSERT INTERVAL>
#e.g. If you want
#every 01 minute: $INTERVAL=1
#every 15 minute: $INTERVAL=15

while ($true) {
    iwr "https://dynamicdns.park-your-domain.com/update?host=$SUBDOMAIN&domain=$DOMAIN&password=$PASSWORD&ip=$((iwr -uri "http://ifconfig.me/ip").Content)"
    Start-Sleep $($INTERVAL*60)
}
