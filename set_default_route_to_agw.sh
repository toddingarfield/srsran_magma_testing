#!/bin/bash
GTP_INTERFACE=tun_srsue
GTP_GW_IP=192.168.128.1
DEF_GW_IP=`ip route | grep default | cut -d ' ' -f 3`
DEF_GW_INTERFACE=`ip route | grep default | cut -d ' ' -f 5`

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "routing table before changes"
ip route

route del default gw $DEF_GW_IP $DEF_GW_INTERFACE
route add default gw $GTP_GW_IP $GTP_INTERFACE

echo "routing table after changes"
ip route
