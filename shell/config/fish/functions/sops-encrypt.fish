function sops-encrypt
    sops --encrypt --ignore-mac --encrypted-regex '^(data|stringData)$' --in-place $argv
end