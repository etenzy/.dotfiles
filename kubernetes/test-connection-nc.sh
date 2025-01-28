#!/usr/bin/env sh

for ip in IPS; do 
    for port in PORTS; do
        printf "$(date '+%Y-%m-%d %H:%M:%S') | nc on $ip:$port => "
        nc -v -z -w 3 $ip $port &> /dev/null \
            && printf "\e[92msuccess\e[0m\n" \
            || printf "\e[91mfailed\e[0m\n"  
    done 
done