#!/bin/bash

if [ "$#" != 3 ]; then
  echo "Usage: ./cpair_tunnel.sh <private IP> <public IP> <desired port>" 
  echo "The private IP is typicaly displayed in your cpair terminal prompt. The public IP can be found through any number of ways such as 'curl icanhazip.com'." 
  exit 1
fi

ssh "$1" "-A" "-o" "UserKnownHostsFile=/dev/null" "-o" "StrictHostKeyChecking=no" "-l" "admin" "-o" "ProxyCommand ssh -A -o StrictHostKeyChecking=no -q -l ec2-user $2 nc %h %p" "-L" "$3:localhost:$3"
