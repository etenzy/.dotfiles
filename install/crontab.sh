#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_CRONJOB_DAILY" == "true" ]]; then
    echo ''
    echo 'Install daily cronjob'
    echo '---------------------'
    echo "30 9 * * * /Users/$(whoami)/.dotfiles/jobs/daily >> /dev/null 2>&1" | sudo tee -a "/var/at/tabs/$(whoami)"
fi

if [[ "$ENABLE_INSTALL_CRONJOB_WEEKLY" == "true" ]]; then
    echo ''
    echo 'Install weekly cronjob'
    echo '----------------------'
    echo "30 10 * * 1 /Users/$(whoami)/.dotfiles/jobs/weekly >> /dev/null 2>&1" | sudo tee -a "/var/at/tabs/$(whoami)"
fi

if [[ "$ENABLE_INSTALL_CRONJOB_MONTHLY" == "true" ]]; then
    echo ''
    echo 'Install monthly cronjob'
    echo '----------------------'
    echo "30 11 15 * * /Users/$(whoami)/.dotfiles/jobs/monthly >> /dev/null 2>&1" | sudo tee -a "/var/at/tabs/$(whoami)"
fi