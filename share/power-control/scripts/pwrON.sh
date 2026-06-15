#!/bin/bash

echo "1" > ./share/power-control/state.txt
echo "pwrON.sh Ran at $(date)" >> ./demo_log.txt