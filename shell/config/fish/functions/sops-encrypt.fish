function sops-encrypt
    sops --encrypt --encrypted-regex '^(data|stringData)$' --in-place $argv
end