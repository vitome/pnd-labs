#!/bin/bash
xrdb ../../.XDefaults
sudo kathara lstart --privileged
for p in pc1 pc2 r1 r2
do
  xterm -e bash -c "kathara connect $p" &
done
xrdb ../../.XDefaults.alt
xterm -e bash -c "kathara connect a1" &

