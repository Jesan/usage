#!/bin/sh


export queue_id=$1
export maxrate=$2


sudo ovs-vsctl -- -- set queue $queue_id other-config:max-rate=$maxrate other-config:min-rate=$maxrate
 

