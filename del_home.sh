#!/bin/sh

export qos_id=$1
export q_id=$2

sudo ovs-vsctl -- -- clear port p1p2 qos
sudo ovs-vsctl -- -- destroy qos $qos_id
sudo ovs-vsctl -- -- destroy queue $q_id
