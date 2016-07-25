#!/bin/bash

echo "Deleting child accounts from all Zimbra accounts"
echo "------------------------------------------------"
echo "C = ChildAccount"
echo "P = PrefChildVisibleAccount"
echo ""

for i in `zmprov sa '|(zimbraChildAccount=*)(zimbraPrefChildVisibleAccount=*)'`; do
    echo "Child accounts for $i"
    for j in `zmprov ga $i | grep zimbraChildAccount | awk -F' ' '{ print $2 }'`; do
        echo -n "C: "
        zmprov sa "|(zimbraId=$j)"
        zmprov ma $i -zimbraChildAccount $j
    done
    for j in `zmprov ga $i | grep zimbraPrefChildVisibleAccount | awk -F' ' '{ print $2 }'`; do
        echo -n "P: "
        zmprov sa "|(zimbraId=$j)"
        zmprov ma $i -zimbraPrefChildVisibleAccount $j
    done
    echo ""
done
