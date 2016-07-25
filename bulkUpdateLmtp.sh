#!/bin/bash

echo "Bulk-updating LMTP settings"
echo "---------------------------"
echo "Old: lmtp:$1:7025"
echo "New: lmtp:$2:7025"
echo ""
 
for i in `zmprov sa "|(zimbraMailTransport=$1)"`; do
    echo "Updating $i"
    zmprov ma $i -zimbraMailTransport lmtp:$1:7025
    zmprov ma $i zimbraMailTransport lmtp:$2:7025
done
