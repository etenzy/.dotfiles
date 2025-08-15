function mediainfo-bitrate --description 'OverallBitRate → Mibit/s via mediainfo + jq'
    for cmd in mediainfo jq
        if not type -q $cmd
            echo "Error: '$cmd' not found in PATH." >&2
            return 127
        end
    end

    set -l raw 0
    if test (count $argv) -gt 0 -a "$argv[1]" = "--raw"
        set raw 1
        set -e argv[1]
    end

    if test (count $argv) -eq 0
        echo "Usage: (status current-command) [--raw] FILE [FILE...]" >&2
        return 2
    end

    for file in $argv
        if not test -r "$file"
            echo "Error: cannot read '$file'" >&2
            continue
        end

        # Run mediainfo with JSON output
        set -l json_output (mediainfo --full --Output=JSON "$file")
        
        # Try to extract OverallBitRate from General track first
        set -l bitrate (echo $json_output | jq -r '.media.track[] | select(.["@type"] == "General") | .OverallBitRate | tonumber?' 2>/dev/null)
        
        # If not found or not a number, try Video track's BitRate
        if test -z "$bitrate" -o "$bitrate" = "null" -o "$bitrate" = ""
            set -l bitrate (echo $json_output | jq -r '.media.track[] | select(.["@type"] == "Video") | .BitRate | tonumber?' 2>/dev/null | head -1)
        end

        # If not found or not a number, try first Audio track's BitRate
        if test -z "$bitrate" -o "$bitrate" = "null" -o "$bitrate" = ""
            set -l bitrate (echo $json_output | jq -r '.media.track | map(select(."@type"=="Audio" and ."@typeorder"=="1"))[0] | .BitRate | tonumber?' 2>/dev/null | head -1)
        end

        # If not found or not a number, try Audio track's BitRate
        if test -z "$bitrate" -o "$bitrate" = "null" -o "$bitrate" = ""
            set -l bitrate (echo $json_output | jq -r '.media.track | map(select(.["@type"] == "Audio"))[0] | .BitRate | tonumber?' 2>/dev/null | head -1)
        end

        # Check if we got a valid bitrate
        if test -z "$bitrate" -o "$bitrate" = "null" -o "$bitrate" = ""
            echo "Error: Could not extract bitrate information"
            return 1
        end

        # Ensure numeric
        if not string match -rq '^[0-9]+(\.[0-9]+)?$' -- "$bitrate"
            echo "Error: Non-numeric (Overall)-BitRate for '$file': $bitrate" >&2
            continue
        end

        # Convert bits/s → Mibit/s (divide by 1024*1024), round to 2 decimals
        set -l mibit (math -s 2 "$bitrate / (1024 * 1024)")

        if test $raw -eq 1
            echo $mibit
        else
            if test (count $argv) -gt 1
                echo -e "$file:$mibit Mibit/s"
            else
                echo "$mibit Mibit/s"
            end
        end
    end
end