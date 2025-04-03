#!/bin/bash
xrdb ../../.XDefaults
sudo kathara lstart --privileged
for p in pc1 pc2 pc3
do
  xterm -e bash -c "kathara connect $p" &
done
xrdb ../../.XDefaults.alt
xterm -e bash -c "kathara connect r1" &

