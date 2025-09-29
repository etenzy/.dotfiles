function clear-quarantine --description "Remove macOS quarantine attribute from given file(s)"
    if test (count $argv) -eq 0
        echo "Usage: clear-quarantine PATH [PATH ...]"
        return 2
    end

    if test (uname) != "Darwin"
        echo "Error: clear-quarantine only works on macOS."
        return 3
    end

    set -l failures 0

    for target in $argv
        if not test -e "$target"
            echo "Not found: $target"
            set failures 1
            continue
        end

        # Try recursive delete first (covers bundles / directories); fall back to non-recursive.
        if not xattr -dr com.apple.quarantine "$target" 2>/dev/null
            if not xattr -d com.apple.quarantine "$target" 2>/dev/null
                echo "No quarantine attribute (or failed): $target"
                continue
            end
        end
        echo "Cleared quarantine: $target"
    end

    return $failures
end