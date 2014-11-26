#!/bin/sh

echo "setting up initial setup"

export down=$3
export p=$2
export qos=$1


sudo ovs-vsctl clear Port $p  Qos
sudo ovs-vsctl -- --all destroy Qos
sudo ovs-vsctl -- --all destroy Queue


#Set the rate limit 
sudo ovs-vsctl -- set port $p qos=@newqos -- --id=@newqos create qos type=linux-htb other-config:max-rate=$qos queues=0=@q0,1=@q1 -- --id=@q0 create queue other-config:max-rate=10000000 -- --id=@q1 create queue other-config:max-rate=$down
