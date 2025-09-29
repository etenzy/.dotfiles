function fix-tempdir --description "Reset TMPDIR to DARWIN_USER_TEMP_DIR"
    if not type -q getconf
        echo "fix-tempdir: getconf not found" 1>&2
        return 1
    end

    set -l target (getconf DARWIN_USER_TEMP_DIR 2>/dev/null)
    if test -z "$target"
        echo "fix-tempdir: could not determine DARWIN_USER_TEMP_DIR" 1>&2
        return 1
    end

    set -x TMPDIR $target
    echo "TMPDIR set to: $TMPDIR"
end