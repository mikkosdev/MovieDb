helm install external-dns bitnami/external-dns `
  --namespace app-routing-system `
  --set txtOwnerId=external-dns `
  --values ..\helm\external-dns-values.yaml
