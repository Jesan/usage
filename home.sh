#!/bin/sh


export p=$1

sudo ovs-vsctl clear port $p qos

sudo ovs-vsctl -- --all destroy Qos
sudo ovs-vsctl -- --all destroy Queue

sudo ovs-vsctl -- set port $p qos=@newqos -- --id=@newqos create QoS type=linux-htb other-config:max-rate=10000000 queues=0=@q0,1=@q1 -- --id=@q0 create Queue other-config:max-rate=10000000 -- --id=@q1 create Queue other-config:min-rate=1000000

