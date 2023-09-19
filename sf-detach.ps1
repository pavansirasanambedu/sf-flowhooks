$token = $env:TOKEN

$flowhookname = $env:flowhookname

# Print the flowHookPoint from the JSON data
Write-Host "flowhookname: $env:flowhookname"

# Define your Apigee API endpoint
$apiEndpoint = "https://apigee.googleapis.com/v1/organizations/esi-apigee-x-394004/environments/eval/flowhooks/"+$flowhookname

# Set up the headers (replace with your actual headers)
$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $token"
}

# Make the API request with the JSON data as the body
$response = Invoke-RestMethod -Uri $apiEndpoint -Method DELETE -Headers $headers

# Handle the API response as needed
# For example, you can check the response status code or content
if ($response) {
    Write-Host "API response received: $($response | ConvertTo-Json -Depth 4)"
} else {
    Write-Host "API request failed."
}

