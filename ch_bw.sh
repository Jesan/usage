#!/bin/sh

export qos=$1
export p=$2
export q0=$3
export q1=$4

sudo ovs-vsctl clear port $p Qos
sudo ovs-vsctl -- --all destroy Qos
sudo ovs-vsctl -- --all destroy Queue

sudo ovs-vsctl -- set port $p qos=@newqos -- --id=@newqos create QoS other-config:max-rate=$qos type=linux-htb other-config:max−rate=10000000 queues=0=@q0,1=@q1 -- --id=@q0 create Queue other-config:max-rate=$q0 -- --id=@q1 create Queue other-config:min-rate=$q1 
