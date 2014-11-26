#!/bin/bash

export name=$1
export device_id=$2
export maxrate=$3
export minrate=$4


sudo ovs-vsctl -- set port p1p2 qos=@newqos -- --id=@newqos create qos type=linux-htb queues=1=@q1 -- --id=@q1 create queue other-config:max-rate=$maxrate other-config:min-rate=$minrate 



curl -X DELETE -d '{"name":"'"$name"'"}'http://149.171.37.183:8080/wm/staticflowentrypusher/json


curl -d '{"switch": "00:00:a0:36:9f:1e:0c:cd", "name":"'"$name"'", "cookie":"0", "priority":"32768", "dst-mac":"'"$device_id"'","active":"true", "actions":"enqueue=2:1"}' http://149.171.37.183:8080/wm/staticflowentrypusher/json
