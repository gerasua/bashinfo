#! /bin/bash
# Just for Red Hat
read -p "Enter your password: " -s PASSWORD
command="echo Hostname:;hostname;echo OS Version:;cat /etc/redhat-release;echo System Date;date;echo System Uptime;uptime | awk '{print \$3}';echo Installed Kernel Date:;rpm -qa --last | grep -i kernel | grep -v "dev" | grep -v "headers" | head -1 | awk '{print \$2, \$3, \$4, \$5, \$6, \$7, \$8}';echo Installed Kernel:;rpm -qa --last | grep -i kernel | grep -v "dev" | grep -v "headers" | head -1 | awk '{print \$1}';echo Available Kernel:;yum list kernel | grep kernel | tail -1 | awk '{print \$2}';echo ---------------------------------------------------------------------;"
for host in $(cat list.txt); do sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no "${host}" "${command}" >>"outputkernel"; done