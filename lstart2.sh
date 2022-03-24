#! /bin/sh
  
# make the assumption of a lab.conf file in which all the routers
# are named just rx where x is a number.

devices=$(grep -oP '[a-z]{1,2}[0-9]{1}\[' lab.conf | sort --unique)
sudo kathara lstart --privileged
for device in $devices; do
        device=${device%?}
        if [ ${device%?} = "r"  ]; then
                xrdb ../.XDefaults.alt
                xterm -e bash -c "kathara connect $device" &
        else
                xrdb ../.XDefaults
                xterm -e bash -c "kathara connect $device" &
        fi
done

