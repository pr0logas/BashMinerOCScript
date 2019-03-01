# BashMinerOCScript for Equihash & Zhash (EWBF)

Tested with RHEL7/Centos7 and NVIDIA driver 385+

**instructions**

Copy miner.service file to:

    /etc/systemd/system/
    
Copy miner.sh & oc.sh to:

    /usr/local/bin/

Make sure req permission are set:

    chmod +x /usr/local/bin/miner.sh && chmod +x /usr/local/bin/oc.sh
    
Locate your mining software path in miner.sh:

    MINER_EXEC=/opt/0.3.3b/miner & pool / wallet / port settings

Start the service:
    
    systemctl start miner

Enable after reboot:

    systemctl enable miner

Check current mining status:

    tail -f /var/log/miner.log
    
![Alt text](https://github.com/pr0logas/BashMinerOCScript/blob/master/Selection_08333.png?raw=true)  

No guarantee use at own risk (especially with oc.sh)
