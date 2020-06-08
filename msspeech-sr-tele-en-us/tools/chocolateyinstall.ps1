$ErrorActionPreference = 'Stop'; # stop on all errors

$url        = 'https://download.microsoft.com/download/4/0/D/40D6347A-AFA5-417D-A9BB-173D937BEED4/MSSpeech_SR_en-US_TELE.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url
  softwareName  = 'Microsoft Server Speech Recognition Language - TELE (en-US)'
  checksum      = '854DB2D4CF44DD94D1F6E62659F3C08D695EF13F7C2D599D9825B0305FB54227'
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @packageArgs
