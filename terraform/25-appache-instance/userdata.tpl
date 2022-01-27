#!/bin/bash -ex

yum update -y

yum -y install httpd

cat > /var/www/html/index.html << 'EOF'
<h1>H E L L O  W o r l d</h1>
EOF

systemctl start httpd
systemctl enable httpd
systemctl status httpd
