#!/bin/sh

export qos=$1
export port=$2
export queue_id=$3
export maxrate=$4


sudo ovs-vsctl -- set port $port qos=@$qos -- --id=@$qos create QoS type=linux-htb queues=1=@$queue_id -- --id=@$queue_id create Queue other-config:max-rate=$maxrate
