# This only works with non-Free accounts
$acr_registry_name = "acrmoviedbdevne"
$image_name = "moviedbserver:latest"

az acr build --registry $acr_registry_name --image $image_name .
