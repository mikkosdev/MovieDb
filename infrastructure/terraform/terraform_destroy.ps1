param (
    [string]$environment
)

# Check if the environment parameter is provided
if (-not $environment) {
    Write-Host "Please provide an environment argument (e.g., development, production)."
    exit 1
}

. .\set_env.ps1

terraform destroy -var-file="${environment}.tfvars"