#!/bin/bash

export name=$1
export n=$2
export device_id=$3
export maxrate=$4
export minrate=$5


sudo ovs-vsctl -- set port p1p2 qos=@newqos -- --id=@newqos create qos type=linux-htb  queues=$n=@q$n -- --id=@q$n create queue other-config:max-rate=$maxrate other-config:min-rate=$minrate


curl -d '{"switch": "00:00:a0:36:9f:1e:0c:cd", "name":"'"$name"'", "priority":"32768","cookie":"0","dst-mac":"'"$device_id"'","active":"true", "actions":"enqueue=2:'"$n"'"}' http://149.171.37.183:8080/wm/staticflowentrypusher/json


