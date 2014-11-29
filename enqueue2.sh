#!/bin/bash

export name=$1
export device_id=$3
export maxrate=$4
export minrate=$5
export n=$2

sudo ovs-vsctl -- -- set port em3 qos=@newqos -- --id=@newqos  create qos type=linux-htb queues=$n=@q1 -- --id=@q1 create queues other-config:min-rate=$minrate other-config:max-rate=$maxrate



curl -d '{"switch":"00:00:b8:ca:3a:5f:cf:59" , "name":"'"$name"'","cookie":"0","priority":"10000","action":"enqueue=3:"'"$n"'","dst-mac":"'"$device_id"'","active":"true"}' http//149.171.37.183:8080/wm/staticflowentrypusher/json  
