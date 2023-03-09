#!/bin/bash
if [ $# -eq 0 ]
then
   echo "ERROR: usage $0 IPADDR/NETMASK [NETWORK_NAME]"
   exit 0
fi
echo "setting up host veth"

sudo ip link del veth1 type veth
sudo ip link add veth1 type veth
sudo ip addr flush veth0
sudo ip addr add $1 dev veth0
if [ -z "$2" ]
then
   echo "Network name not provided: assume only one lan exists..."
   bridge="$(sudo docker network ls | grep -e 'kathara_.*' | grep -o '^[a-z0-9]*' | head -n 1)"
else
   bridge="$(sudo docker network ls | grep -e "kathara_${USER}.*_$2" | grep -o '^[a-z0-9]* ')"
fi

echo
echo "attaching veth1 to lan $2, bridge: kt-${bridge}"

sudo ip link set veth1 master kt-${bridge}

sudo ip link set veth0 up
sudo ip link set veth1 up
ip addr show dev veth1
ip addr show dev veth0

 
