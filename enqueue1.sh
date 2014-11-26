#!/bin/bash

export switch=$1
export name=$2
export portno=$3
export queueid=$4
export device_id=$5

curl -X DELETE -d '{"name":"'"$name"'"}'http://149.171.37.183:8080/wm/staticflowentrypusher/json


curl -d '{"switch": "'"$switch"'", "name":"'"$name"'", "cookie":"0", "priority":"32768", "dst-mac":"'"$device_id"'","active":"true", "actions":"enqueue='"$portno"':'"$queueid"'"}' http://149.171.37.183:8080/wm/staticflowentrypusher/json
