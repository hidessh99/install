#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi

mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain

ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2


mkdir -p /var/lib/scrz-prem >/dev/null 2>&1
echo "IP=" >> /var/lib/scrz-prem/ipvps.conf


wget -q https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/tools.sh;chmod +x tools.sh;./tools.sh
rm tools.sh
clear

clear
yellow "Add Domain for vmess/vless/trojan dll"
echo " "
read -rp "Input ur domain : " -e pp
    if [ -z $pp ]; then
        echo -e "
        Nothing input for domain!
        Then a random domain will be created"
    else
        echo "$pp" > /root/scdomain
	echo "$pp" > /etc/xray/scdomain
	echo "$pp" > /etc/xray/domain
	echo "$pp" > /etc/v2ray/domain
	echo $pp > /root/domain
        echo "IP=$pp" > /var/lib/scrz-prem/ipvps.conf
    fi
    
#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH / WS               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
sleep 2
clear
wget https://raw.githubusercontent.com/hidessh99/install/main/nginx-ssl.sh && chmod +x nginx-ssl.sh && ./nginx-ssl.sh


#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install Websocket              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh

#exp
cd /usr/bin
wget -O userdelexpired "https://gitlab.com/hidessh/baru/-/raw/main/userdelexpired.sh"
chmod +x userdelexpired
sleep 1


cd


echo "installing insaller Slowdns "
echo "Progress..."
echo "Sedang berlangsung..."
wget https://raw.githubusercontent.com/hidessh99/projectku/main/Slowdns/hidessh-slowdns && chmod +x hidessh-slowdns && ./hidessh-slowdns
sleep 1


cd
#remove log 
wget -q -O /usr/bin/removelog "https://raw.githubusercontent.com/hidessh99/HIDE-package/main/log.sh" && chmod +x /usr/bin/removelog
sleep 1

#cronjob
echo "30 * * * * root removelog" >> /etc/crontab



#install remove log
echo "0 5 * * * root clear-log && reboot" >> /etc/crontab
echo "0 17 * * * root clear-log && reboot" >> /etc/crontab
echo "50 * * * * root userdelexpired" >> /etc/crontab


echo "installing insaller l2tp/IPsec"
echo "Progress..."
echo "Sedang berlangsung..."
sleep 3
echo "silahkan dibaca, proses pemasangan semua script memakan waktu paling lama 10 menit sampai 30 menit"
echo "Jika masih dalam tahap instalasi..."
echo "jangan keluar dari terminal atau aplikasi"
echo -e "[ ${green}INFO${NC} ] in the process of installing tools"
echo -e "[ ${green}INFO${NC} ] dalam proses pemasangan alat"
sleep 1
wget https://raw.githubusercontent.com/hidessh99/projectku/main/ipsec/hidesetup-ipsec.sh && chmod +x hidesetup-ipsec.sh && ./hidesetup-ipsec.sh
sleep 1
echo "Download package tambahan untuk l2tp/ipsec"
wget -O /usr/local/bin/stdev-l2tp-get-psk "https://raw.githubusercontent.com/hidessh99/projectku/main/ipsec/stdev-l2tp-get-psk"
wget -O /usr/local/bin/stdev-l2tp-add-user "https://raw.githubusercontent.com/hidessh99/projectku/main/package-tambahan/stdev-l2tp-add-user"
wget -O /usr/local/bin/stdev-l2tp-remove-user "https://raw.githubusercontent.com/hidessh99/projectku/main/package-tambahan/stdev-l2tp-remove-user"

echo "permission file ipsec/l2tp"
chmod +x /usr/local/bin/stdev-l2tp-get-psk 
chmod +x /usr/local/bin/stdev-l2tp-add-user
chmod +x /usr/local/bin/stdev-l2tp-remove-user


sleep 1
echo -e "[ ${green}INFO${NC} ] DONE... ALAT"
sleep 1
echo "Progress..."
echo "Sedang berlangsung..."
sleep 3


echo "installing insaller wireguard"
echo "Progress..."
echo "Sedang berlangsung..."
sleep 3
echo "silahkan dibaca, proses pemasangan semua script memakan waktu paling lama 10 menit sampai 30 menit"
echo "Jika masih dalam tahap instalasi..."
echo "jangan keluar dari terminal atau aplikasi"
echo -e "[ ${green}INFO${NC} ] in the process of installing tools"
echo -e "[ ${green}INFO${NC} ] dalam proses pemasangan alat"
sleep 1
wget https://raw.githubusercontent.com/hidessh99/projectku/main/wireguard/hidewp-setup.sh && chmod +x hidewp-setup.sh && ./hidewp-setup.sh
echo "Menajemen wireguard"
sleep 1
wget -O install-wireguard "https://www.dropbox.com/s/p89ubjpypmk26rv/install-wireguard?dl=1" && chmod +x install-wireguard && ./install-wireguard
sleep 1
cd
echo -e "[ ${green}INFO${NC} ] DONE... ALAT"
sleep 1
echo "Progress..."
echo "Sedang berlangsung..."
sleep 3
