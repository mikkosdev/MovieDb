Write-Host "Setting dev-specific environment variables"

# PowerShell

$Env:ARM_RESOURCE_GROUP = "rg-moviedb-dev-ne"
$Env:ARM_CLUSTER_NAME = "aks-moviedb-dev-ne"
$Env:ARM_LOCATION = "northeurope"

# Terraform

$Env:TF_VAR_arm_resource_group = $Env:ARM_RESOURCE_GROUP
