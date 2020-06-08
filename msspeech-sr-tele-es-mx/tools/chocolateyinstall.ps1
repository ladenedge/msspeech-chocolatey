$ErrorActionPreference = 'Stop'; # stop on all errors

$url        = 'https://download.microsoft.com/download/4/0/D/40D6347A-AFA5-417D-A9BB-173D937BEED4/MSSpeech_SR_es-MX_TELE.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url
  softwareName  = 'Microsoft Server Speech Recognition Language - TELE (es-MX)'
  checksum      = '263476526C9BA9F7B07D5624D67BBF4365F6330BCED6EC92F01A89A3241C60FA'
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @packageArgs
