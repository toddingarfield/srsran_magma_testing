#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

#ip netns add ue1
srsue --usim.algo=milenage \
	--usim.opc=63BFA50EE6523365FF14C1F45F88737D \
        --usim.imsi=001090000000001 \
	--usim.k=00112233445566778899aabbccddeeff \
	--rf.device_name=zmq \
       	--rf.device_args="tx_port=tcp://*:2001,rx_port=tcp://localhost:2000,id=ue,base_srate=23.04e6" \
        --log.all_level warning \
	--log.nas_level debug \
	--log.gw_level debug \
	--log.usim_level debug \
	--log.filename /tmp/ue.log
#ip netns delete ue1
