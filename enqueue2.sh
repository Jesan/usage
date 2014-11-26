#!/bin/bash

export name=$1
export device_id=$2
export maxrate=$3
export minrate=$4


sudo ovs-vsctl -- -- set port em3 qos=@newqos -- --id=@newqos  create qos type=linux-htb queues=0=@q0,1=@q1 -- --id=@q0 create queues other-config:max-rate=10000000 -- --id=@q1 create queues other-config:min-rate=$minrate other-config:max-rate=$maxrate

curl -X DELETE -d '{"name":"'"$name"'"}' http://149.171.37.183:8080/wm/staticflowentrypusher/json

curl -d '{"switch":"00:00:b8:ca:3a:5f:cf:59" , "name":"'"$name"'","cookie":"0","priority":"10000","action":"enqueue=3:1","dst-mac":"'"$device_id"'","active":"true"}' http//149.171.37.183:8080/wm/staticflowentrypusher/json  
