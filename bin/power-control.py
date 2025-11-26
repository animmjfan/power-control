#!/usr/bin/env python3

# if anything goes wrong (that is not user error) file an issuse on github
# hope you like it...
# ...and hope it works! please!! (currently not working)

import subprocess, os, sys

oldState = "2"
doCheck = 0
binPath = os.path.dirname(os.path.realpath(sys.argv[0]))
sharePath = os.path.realpath(binPath+"/../share")

while True:
	while doCheck == 0:
		with open(str(os.path.realpath(sharePath+"/power-control/state.txt")), 'r') as file:
			state = file.read().strip()
		if state != oldState:
			doCheck = 1
		else:
			doCheck = 0
		oldState = state
		file.close()

	with open(str(os.path.realpath(sharePath+"/power-control/state.txt")), 'r') as file:
		state = file.read().strip()
	if state == "1":
		subprocess.call(os.path.realpath(sharePath+"/power-control/scripts/pwrON.sh"))
	elif state == "0":
		subprocess.call(os.path.realpath(sharePath+"/power-control/scripts/pwrOFF.sh"))
	file.close()
	doCheck = 0