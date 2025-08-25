# Creates a test file on the Desktop
$desktopPath = [Environment]::GetFolderPath("Desktop")
$filePath = Join-Path $desktopPath "FleetTestFile.txt"

"Hello from Fleet QA script!" | Out-File -FilePath $filePath -Encoding UTF8

Write-Output "File created at $filePath"
