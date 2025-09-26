# Tries to write to a protected system folder (will fail without admin rights)
"Test content" | Out-File -FilePath "C:\Windows\System32\fleet_test.txt"
