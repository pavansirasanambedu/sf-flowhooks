$token = $env:TOKEN

# Define the path to the JSON file
$jsonFilePath = "flowhook_jsondata/flowhook_attachjsondata.json"

# Read the JSON data from the file
$jsonData = Get-Content -Path $jsonFilePath | ConvertFrom-Json

# Print the flowHookPoint from the JSON data
Write-Host "flowHookPoint: $($jsonData.flowHookPoint)"

# Define your Apigee API endpoint
$apiEndpoint = "https://apigee.googleapis.com/v1/organizations/esi-apigee-x-394004/environments/eval/flowhooks/"+$($jsonData.flowHookPoint)
# /v1/organizations/{org}/environments/{env}/apis/{api}/revisions/{revision}/flowhooks/{flowhook}?action=attach&sharedFlow={sharedFlowNameOrID}

# Convert the JSON data back to a string
$jsonBody = $jsonData | ConvertTo-Json

# Set up the headers (replace with your actual headers)
$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $token"
}

# Make the API request with the JSON data as the body
$response = Invoke-RestMethod -Uri $apiEndpoint -Method PUT -Headers $headers -Body $jsonBody

# Handle the API response as needed
# For example, you can check the response status code or content
if ($response) {
    Write-Host "API response received: $($response | ConvertTo-Json -Depth 4)"
} else {
    Write-Host "API request failed."
}

