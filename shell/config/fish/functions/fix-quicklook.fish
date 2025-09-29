function fix-quicklook --description "Clear quarantine attributes from QuickLook plugins"
    if not type -q clear-quarantine
        echo "clear-quarantine command not found" 1>&2
        return 127
    end

    set -l targets ~/Library/QuickLook/*
    if test (count $targets) -eq 1 -a ! -e $targets[1]
        echo "No QuickLook items found in ~/Library/QuickLook" 1>&2
        return 0
    end

    for f in $targets
        clear-quarantine $f
    end
    echo "Done."
end