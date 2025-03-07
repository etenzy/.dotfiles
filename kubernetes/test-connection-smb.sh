#!/usr/bin/env sh

ip="IP"
share="SHARE"
user="USER"
password="PASSWORD"

sharestring="//$ip/$share/"

printf "$(date '+%Y-%m-%d %H:%M:%S') | smbclient on $sharestring => "
    smbclient --user "$user" --password "$password" "$sharestring" -c 'listconnect' &> /dev/null \
        && printf "\e[92msuccess\e[0m\n" \
        || printf "\e[91mfailed\e[0m\n"