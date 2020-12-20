#!/bin/bash
# http://update.cs2c.com.cn:8080/NS/

# reposync 解决了问题

cat > yum-cs2c-v10.conf << EOF
###Kylin Linux Advanced Server 10 - os repo###
[ks10-adv-os]
name = Kylin Linux Advanced Server 10 - Os 
baseurl = http://update.cs2c.com.cn:8080/NS/V10/V10SP1/os/adv/lic/base/$basearch/
gpgcheck = 0
enabled = 1
[ks10-adv-updates]
name = Kylin Linux Advanced Server 10 - Updates
baseurl = http://update.cs2c.com.cn:8080/NS/V10/V10SP1/os/adv/lic/updates/$basearch/
gpgcheck = 0
enabled = 0
[ks10-adv-addons]
name = Kylin Linux Advanced Server 10 - Addons
baseurl = http://update.cs2c.com.cn:8080/NS/V10/V10SP1/os/adv/lic/addons/$basearch/
gpgcheck = 0
enabled = 0
EOF 


reposync --config yum-cs2c-v10.conf -d -p /data/cs2c/NS/V10/V10SP1/os/adv/lic/
