# TODO: parametrize

az acr list --resource-group rg-moviedb-dev-ne --query "[].{acrLoginServer:loginServer}" --output table
