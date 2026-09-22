function kubeconfig-flatten --description 'Safely flatten kubeconfig files in ~/.kube directory'
    # Validate prerequisites
    if not command -q kubectl
        echo "Error: kubectl is not installed or not in PATH" >&2
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
        cp $config_file "$backup_dir/config.backup.$(date +%Y%m%d_%H%M%S)"
        echo "Created backup of current config"
    end

    # Set KUBECONFIG and flatten
    set -gx KUBECONFIG (find "$HOME/.kube" -maxdepth 1 -type f ! -name '.DS_Store' | tr '\n' ':' | sed 's/:$//')
    
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

    find "$HOME/.kube" -maxdepth 1 -type f ! -name '.DS_Store' ! -name 'config' -delete

    echo "Successfully flattened kubeconfig"
    
    # Reset KUBECONFIG to just the main config
    set -gx KUBECONFIG $config_file
end