#!/bin/bash
if test  ! -f  /etc/squid/squid.conf 
then
  cp -vr /tmp/squid/* /etc/squid
fi
/usr/sbin/squid  -NsY
