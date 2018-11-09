#!/bin/bash
# :: Author Tomas Andriekus
# :: Version v1.1 2017-06-30
# :: pr0logas@protonmail.com
 
# ::Miner Settings::
MINER_EXEC=/opt/0.3.3b/miner
OVERCLOCK_PATH=/usr/local/bin/oc.sh
SERVER=zen.mypool.com
USER=t1LurtmEMEP6sTXKu5atzfzQjNEuiE28h11.RIG03
PASSWORD=x
PORT=3032
FEE=0
TEMPLIMIT=79
SOLVER=0
 
INITIAL_SLEEP_TIME=10
LOG_FILE=/var/log/miner.log
 
# ::Log exec::
rm -fr ${LOG_FILE}_old
mv $LOG_FILE ${LOG_FILE}_old
touch $LOG_FILE
 
echo ""
echo "This is EWBF miner service by pr0logas v1.1" | tee -a $LOG_FILE
sleep $INITIAL_SLEEP_TIME
echo "Checking network connection..." | tee -a $LOG_FILE
 
if [ $(ping -c 3 8.8.8.8 | grep -c "3 received") -eq "1" ]; then
        echo "All set. Network is reachable" | tee -a $LOG_FILE
else
        echo "Network is not reachable, please check the connection. Trying again in 180 seconds..." | tee -a $LOG_FILE && sleep 180 && echo "$(date) Trying one more time to reach outside world..."
if [ $(ping -c 3 8.8.8.8 | grep -c "3 received") -eq "1" ]; then
        echo "Looks like network works now"
else
        echo "NETWORK FAILED, terminating miner service" | tee -a $LOG_FILE && exit 1
fi
fi
 
# ::Overclock::
echo "Starting OverClocking..." | tee -a $LOG_FILE
source $OVERCLOCK_PATH
echo "Overcklocing done;" | tee -a $LOG_FILE
 
# Start miner from this point
stdbuf -o0 $MINER_EXEC --server $SERVER --user $USER --pass $PASSWORD --port $PORT --pec --fee $FEE --templimit $TEMPLIMIT --solver $SOLVER | tee -a $LOG_FILE
