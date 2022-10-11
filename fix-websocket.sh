#!/bin/bash
# ==========================================

#pkill python
pkill python ws-tls 
systemctl daemon-reload
systemctl stop ws-tls 
systemctl stop sslh

systemctl disable ws-tls
systemctl disable sslh
systemctl daemon-reload

systemctl enable sslh
systemctl enable ws-tls

systemctl start sslh 
/etc/init.d/sslh start 
/etc/init.d/sslh restart 
systemctl start ws-tls
systemctl restart ws-tls

sleep 20
