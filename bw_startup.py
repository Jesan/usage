#!/usr/lib/env python
# -*- coding: utf-8 -*-

import json
from bottle import route, run, request , template
from decimal import Decimal
import subprocess




#this is initial API

@route('/uniwide_sdn/usage/<name>/<port>/<device_id>/<maxrate>/<minrate>')
def en(name,port,device_id,maxrate,minrate):
	if port == 'em3':
		sh1="sudo ~/usage/enqueue2.sh" + " " + str(name) + " " + str(device_id) + " " + str(maxrate) + " " + str(minrate)
		print sh1
		sh= "macid" + " " + str(device_id) + "  " + subprocess.check_output(sh1,shell=True)
		sg=sh.split("  ")
		a=" \n".join(sg)
		return a
	elif port == 'patch_cable_21':
		sh7="sudo ~/usage/enqueue3.sh" + " " + str(name) + " " + str(device_id) + " " + str(maxrate) + " " + str(minrate)
		s1="macid" + " " + str(device_id) + "  " + subproces.check_output(sh7,shell=True)
		s2=s1.split("  ")
		c=" \n".join(s2)
		return c

@route('/home_sdn/usage/<name>/<device_id>/<maxrate>/<minrate>')
def home(name,device_id,maxrate,minrate):

        sh2="sudo ~/usage/enqueue1.sh" + " " + str(name) + " " + str(device_id) + " " + str(maxrate) + " " + str(minrate)
        print sh2
        t1= "macid " + " " + str(device_id)+ "   " + subprocess.check_output(sh2,shell=True) 
	t2=t1.split(" ")
	b=" \n".join(t2)
	return b

@route('/home_sdn/control/<queue_id>/<maxrate>')
def home_ctrl(queue_id,maxrate):
	sh3="sudo ~/usage/home.sh" + " " + str(queue_id) + " "+str(maxrate)
	print sh3
	subprocess.call(sh3,shell=True)
	
@route('/uniwide_sdn/control/<queue_id>/<maxrate>')
def uniwide_ctrl(queue_id,maxrate):
	sh4="sudo ~/usage/ch_bw.sh" + " " + str(queue_id) + " " + str(maxrate)
	subprocess.call(sh4,shell=True)

@route('/home_sdn/delete/<qos_id>/<q_id>/<name>')
def del_home(qos_id,q_id,name):
	sh5="sudo ~/usage/del_home.sh" + " " + str(qos_id) + " " + str(q_id) + " " + str(name)
	print sh5
	subprocess.call(sh5,shell=True)

@route('/uniwide_sdn/delete/<port>/qos_id>/<q_id>/<name>')
def del_uni(port,qos_id,q_id,name):
	sh6 ="sudo ~/usage/del_uniwide.sh" + " " + str(port) + " " + str(qos_id) + " " + str(q_id) +" " + str(name)
	subprocess.call(sh6,shell=True)


if __name__ == "__main__":

        print "Running QConfig"
        run(host='149.171.37.218', port=8082)
		
	
