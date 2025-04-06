param (
    [string]$environment
)

# Check if the environment parameter is provided
if (-not $environment) {
    Write-Host "Please provide an environment argument (e.g., development, production)."
    exit 1
}

# Construct the tfvars file name using string interpolation
$tfvarsFile = "${environment}.tfvars"

# Check if the tfvars file exists
if (-not (Test-Path $tfvarsFile)) {
    Write-Host "The file ${tfvarsFile} does not exist."
    exit 1
}

# Run the terraform apply command with the specified tfvars file
terraform apply -var-file="${tfvarsFile}"
