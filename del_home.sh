#!/bin/bash

export qos_id=$1
export q_id=$2
export name=$3

sudo ovs-vsctl -- clear port p1p2 qos
sudo ovs-vsctl -- -- destroy qos $qos_id
sudo ovs-vsctl -- -- destroy queue $q_id


curl -X DELETE -d '{"name":"'"$name"'"}' http://149.171.37.183:8080/wm/staticflowentrypusher/json
