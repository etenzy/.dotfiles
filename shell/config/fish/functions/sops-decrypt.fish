function sops-decrypt
    sops --decrypt --ignore-mac --encrypted-regex '^(data|stringData)$' --in-place $argv
end