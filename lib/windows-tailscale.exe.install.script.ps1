$exeFilePath = "${env:INSTALLER_PATH}"
$installProcess = Start-Process $exeFilePath `
  -ArgumentList "/quiet /norestart" `
    -PassThru -Verb RunAs -Wait
