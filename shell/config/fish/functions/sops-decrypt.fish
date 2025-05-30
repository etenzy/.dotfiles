function sops-decrypt
    sops --decrypt --encrypted-regex '^(data|stringData)$' --in-place $argv
end