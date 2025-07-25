function remove-host --description 'Remove host from known_hosts file'
    set -l host $argv[1]
    if test -z "$host"
        echo "Usage: remove-host <hostname>"
        return 1
    end
    ssh-keygen -R "$host"
    echo "Host '$host' removed from known_hosts."
end