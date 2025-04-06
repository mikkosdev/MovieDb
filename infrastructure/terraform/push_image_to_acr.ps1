$acr_registry_name = "acrmoviedbdevne"
$image_name = "moviedbserver:latest"

Write-Output "Logging in"
#az acr login --name acrmoviedbdevne

Write-Output "Tagging"
docker tag $image_name "${acr_registry_name}.azurecr.io/${image_name}"

Write-Output "Pushing"
docker push "${acr_registry_name}.azurecr.io/${image_name}"
