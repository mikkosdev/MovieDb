$headers = @{
    "Host" = "moviedb.fd3aa0ead8b7482883d4.northeurope.aksapp.io"
}

$response = Invoke-RestMethod -Uri "http://4.245.167.14" -Headers $headers
$response
