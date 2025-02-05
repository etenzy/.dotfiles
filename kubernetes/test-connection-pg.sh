#!/usr/bin/env sh

ips="IPS"
ports="PORTS"
database="DATABASE"
user="USER"

for ip in $ips; do 
    for port in $ports; do
        printf "$(date '+%Y-%m-%d %H:%M:%S') | pg_isready on $ip:$port => "
        pg_isready -h $ip -p $port -d $database -U $user &> /dev/null \
            && printf "\e[92msuccess\e[0m\n" \
            || printf "\e[91mfailed\e[0m\n" 
    done 
done