#!/bin/sh

export qos=$1
export queue_id=$2
export maxrate=$3


sudo ovs-vsctl -- set port p1p2 qos=@newqos -- --id=@$qos create QoS type=linux-htb  queues=1=@$queue_id -- --id=@$queue_id create Queue other-config:max-rate=$maxrate 

