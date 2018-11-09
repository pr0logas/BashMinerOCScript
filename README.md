# BashMinerOCScript

Tested with RHEL7/Centos7

**instructions**

    copy miner.service file to /etc/systemd/system/
    copy miner.sh & oc.sh to /usr/local/bin/
    make sure req permission are set - chmod +x /usr/local/bin/miner.sh && chmod +x /usr/local/bin/oc.sh
    locate your mining software path in miner.sh - MINER_EXEC=/opt/0.3.3b/miner
    start the service - systemctl start miner
    enable after reboot - systemctl enable miner
    check current mining status - tail -f /var/log/miner.log

No guarantee use at own risk (especially with oc.sh)
