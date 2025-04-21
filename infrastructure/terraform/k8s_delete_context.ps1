# Get all contexts
$contextsOutput = kubectl config get-contexts --no-headers

foreach ($line in $contextsOutput) {
    # Split line by whitespace (ignores multiple spaces/tabs)
    $parts = $line -split "\s+"

    # If the first column is '*', the current context, shift everything
    if ($parts[0] -eq '*') {
        $contextName = $parts[1]
        $clusterName = $parts[2]
        $userName = $parts[3]
    } else {
        $contextName = $parts[0]
        $clusterName = $parts[1]
        $userName = $parts[2]
    }

    Write-Host "Deleting context: $contextName"
    kubectl config delete-context $contextName

    Write-Host "Deleting cluster: $clusterName"
    kubectl config delete-cluster $clusterName

    Write-Host "Unsetting user: $userName"
    kubectl config unset users.$userName

    Write-Host "---------------------------------------"
}
