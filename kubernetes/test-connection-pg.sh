#!/usr/bin/env sh

for ip in IPS; do 
    for port in PORTS; do
        printf "$(date '+%Y-%m-%d %H:%M:%S') | pg_isready on $ip:$port => "
        pg_isready -h $ip -p $port -d DATABASE -U USER &> /dev/null \
            && printf "\e[92msuccess\e[0m\n" \
            || printf "\e[91mfailed\e[0m\n" 
    done 
done