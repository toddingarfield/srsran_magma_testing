#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

srsenb --enb.mme_addr=10.0.2.1 \
	--enb.gtp_bind_addr=10.0.2.246 \
	--enb.s1c_bind_addr=10.0.2.246 \
	--rf.device_name=zmq \
	--rf.device_args="fail_on_disconnect=true,tx_port=tcp://*:2000,rx_port=tcp://localhost:2001,id=enb,base_srate=23.04e6" \
	--log.all_level debug \
	--log.filename /tmp/enb.log
