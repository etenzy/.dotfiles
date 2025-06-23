function kubeconfig-flatten --description 'Safely flatten kubeconfig files in ~/.kube directory'
    # Validate prerequisites
    if not command -q kubectl
        echo "Error: kubectl is not installed or not in PATH" >&2
        return 1
    end

    if not command -q rename
        echo "Error: rename command is not available" >&2
        return 1
    end

    # Set variables
    set kube_dir "$HOME/.kube"
    set backup_dir "$kube_dir/.backup"
    set config_file "$kube_dir/config"
    set temp_config "$kube_dir/config_tmp"

    # Ensure directories exist
    if not test -d $kube_dir
        echo "Error: $kube_dir directory does not exist" >&2
        return 1
    end

    mkdir -p $backup_dir

    # Create backup of current config
    if test -f $config_file
        cp $config_file "$backup_dir/config.backup.(date +%Y%m%d_%H%M%S)"
        echo "Created backup of current config"
    end

    # Find and rename .bk files (replace colons with dashes)
    set bk_files (find $kube_dir -maxdepth 1 -type f -name '*.bk' 2>/dev/null)
    
    if test (count $bk_files) -eq 0
        echo "No .bk files found in $kube_dir"
        return 0
    end

    echo "Found "(count $bk_files)" .bk files to process"

    # Rename files to replace colons with dashes
    for file in $bk_files
        if string match -q '*:*' (basename $file)
            if not rename 's/:/-/g' $file 2>/dev/null
                echo "Warning: Failed to rename $file" >&2
            end
        end
    end

    # Get updated list of .bk files after renaming
    set bk_files (find $kube_dir -maxdepth 1 -type f -name '*.bk' 2>/dev/null)

    # Build KUBECONFIG environment variable
    set kubeconfig_list
    for file in $bk_files
        set -a kubeconfig_list $file
    end
    set -a kubeconfig_list $config_file

    # Set KUBECONFIG and flatten
    set -gx KUBECONFIG (string join ':' $kubeconfig_list)
    
    echo "Flattening kubeconfig with "(count $kubeconfig_list)" files..."
    
    if not kubectl config view --raw --flatten > $temp_config 2>/dev/null
        echo "Error: Failed to flatten kubeconfig" >&2
        rm -f $temp_config
        return 1
    end

    # Validate the generated config
    if not kubectl config view --kubeconfig=$temp_config >/dev/null 2>&1
        echo "Error: Generated config is invalid" >&2
        rm -f $temp_config
        return 1
    end

    # Replace the original config
    if not mv $temp_config $config_file
        echo "Error: Failed to update config file" >&2
        return 1
    end

    # Move .bk files to backup directory
    for file in $bk_files
        if not mv $file $backup_dir/
            echo "Warning: Failed to move $file to backup directory" >&2
        end
    end

    echo "Successfully flattened kubeconfig"
    echo "Original .bk files moved to $backup_dir"
    
    # Reset KUBECONFIG to just the main config
    set -gx KUBECONFIG $config_file
end