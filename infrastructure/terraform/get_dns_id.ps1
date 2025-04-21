az aks show `
  --resource-group rg-moviedb-dev-ne `
  --name aks-moviedb-dev-ne `
  --output tsv

#  --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName `

Write-Output "Place the id in aks/deployment.yaml"
