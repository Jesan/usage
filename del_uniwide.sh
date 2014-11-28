#!/bin/sh

export p=$1
export qos_id=$2
export q_id=$3
export name=$4

sudo ovs-vsctl -- -- clear $p qos
sudo ovs-vsctl -- -- destroy qos $qos_id
sudo ovs-vsctl -- -- destroy queue $q_id

sudo curl -X DELETE -d '{ "name": "'"$name"'"}' http://149.171.37.183:8080/wm/staticflowentrypusher/json
