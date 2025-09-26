# Creates a folder under Documents
$docsPath = [Environment]::GetFolderPath("MyDocuments")
$folderPath = Join-Path $docsPath "FleetQAFolder"

New-Item -ItemType Directory -Path $folderPath -Force | Out-Null
Write-Output "Folder created at $folderPath"
