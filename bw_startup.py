#!/usr/lib/env python
# -*- coding: utf-8 -*-

import bottle
import json
from bottle import route, run, request , template
from decimal import Decimal
import subprocess


@route('/localhost/usage')
@route('/uniwide_sdn/usage')
def index_lo():

        #up=Decimal(up) 
        cmd3="sudo ~/scripts/home.sh"
        print cmd3
        subprocess.call(cmd3,shell=True)

#this is initial API
port_list = []
@route('/localhost/usage/<qos>/<port>/<down>')

@route('/uniwide_sdn/usage/<qos>/<port>/<down>')
@route('/home_sdn/usage/<qos>/<port>/<down>')
def index_lo(qos,port,down):

        down=Decimal(down)
        cmd="sudo ~/scripts/initial_setup.sh" + " " + str(qos) + " " + str(port) + " " + str(down)
        print cmd
        subprocess.call(cmd,shell=True)

# this given to ISP so ISP can set the rates for different queues and also for rate limit for two queues

@route('/localhost/<qos>/<port>/<q0>/<q1>')
@route('/uniwide_sdn/<qos>/<port>/<q0>/<q1>')
@route('/home_sdn/<qos>/<port>/<q0>/<q1>')
def upupup(qos,port,q0,q1):

        cmd1= "sudo ~/scripts/ch_bw.sh" + " " + str(qos)+ " " + str(port) + " " + str(q0) + " " + str(q1 )
	print cmd1
        subprocess.call(cmd1,shell=True)

# this is  flow control to set the limit for each device

@route('/localhost/<switch>/<name>/<portno>/<queueid>/<MAC_id>')
def enqueue(switch,name,portno,queueid,MAC_id):
        cmd4="sudo ~/scripts/enqueue.sh" + " " + str(switch) + " " + str(name) +" " + str(portno) + " " + str(queueid) + " " + str(MAC_id)
        subprocess.call(cmd4,shell=True)


@route('/uniwide_sdn/<switch>/<name>/<portno>/<queueid>/<device_id>')

@route('/home_sdn/<switch>/<name>/<portno>/<queueid>/<device_id>')
def enqueue1(switch,name,portno,queueid,device_id):
        cmd5="sudo ~/scripts/enqueue1.sh" +" " + str(switch) + " " + str(name) + " " + str(portno) + " " + str(queueid) + " " + str(device_id)
        subprocess.call(cmd5,shell=True)



if __name__ == "__main__":

        print "Running QConfig"
        run (host='192.168.56.101', port=8082)
