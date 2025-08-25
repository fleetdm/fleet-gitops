# This is a script added via GitOps
$exitCode = $process.ExitCode

# Prints the exit code
Write-Host "Post Install ran. Post Install exit code: $exitCode"
Exit $exitCode
