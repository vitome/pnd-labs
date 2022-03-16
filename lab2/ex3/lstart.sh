#!/bin/bash
sudo kathara lstart --privileged
for p in pc1 pc2 pc3 pc4 r1
do
  xterm -e bash -c "kathara connect $p" &
done

