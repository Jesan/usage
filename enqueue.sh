#!/bin/sh


export switch=$1
export name=$2
export portno=$3
export queueid=$4
export device_id=$5


curl -X DELETE -d '{"name":"'"$name"'"}' http://127.0.0.1:8080/wm/staticflowentrypusher/json

curl -d '{"switch":"'"$switch"'", "name":"'"$name"'", "cookie":"0", "priority":"32768","dst-mac":"'"$MAC_id"'","active":"true", "actions":"enqueue='"$portno"':'"$queueid"'"}' http://127.0.0.1:8080/wm/staticflowentrypusher/json

