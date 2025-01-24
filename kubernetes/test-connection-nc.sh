#!/usr/bin/env bash

ips=(${1:-IPS})
ports=(${2:-PORTS})

for ip in "${ips[@]}"; do 
    for port in "${ports[@]}"; do
        printf "$(date '+%Y-%m-%d %H:%M:%S') | nc on $ip:$port => "
        nc -v -z -w 3 $ip $port &> /dev/null \
            && printf "\e[92msuccess\e[0m\n" \
            || printf "\e[91mfailed\e[0m\n"  
    done 
done