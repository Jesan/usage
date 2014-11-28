#!/bin/bash

export name=$1
export device_id=$2
export maxrate=$3
export minrate=$4

sudo ovs-vsctl -- -- set port patch_cable_21 qos=@newqos -- --id=@newqos create qos type=linux-htb queues=1=@q1 -- --id=@q1 create queues other-config:max-rate=$maxrate other-config:min-rate=$minrate

curl -d '{"switch":"00:00:b8:ca:3a:5f:cf:59","name":"'"$name"'","cookie":"0", "actions":"enqueue=4:1","priority":"1000", "dst-mac":"'"$device_id"'","active":"true"}' http:149.171.37.183:8080/wm/staticflowentrypusher/json
