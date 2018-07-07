#!/bin/sh
filepath='/frp/conf/frpc.ini'
if [ ! -f $filepath ]; then
echo "Error"
exit 1
else
/frp/frpc -c $filepath
fi

