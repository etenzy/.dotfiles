function sops-reencryt
    sops --decrypt --ignore-mac --encrypted-regex '^(data|stringData)$' --in-place $argv
    sops --encrypt --ignore-mac --encrypted-regex '^(data|stringData)$' --in-place $argv
end