$identifierPath = "C:\Program Files\Orbit\identifier"
$fleetUrl = "https://jwatts.ngrok.dev"

if (Test-Path $identifierPath) {
    $identifier = Get-Content $identifierPath
    Write-Output "$fleetUrl/device/$identifier"
} else {
    Write-Output "Identifier file not found at $identifierPath"
}