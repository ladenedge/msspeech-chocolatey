$ErrorActionPreference = 'Stop'; # stop on all errors

$url        = 'https://download.microsoft.com/download/4/0/D/40D6347A-AFA5-417D-A9BB-173D937BEED4/MSSpeech_SR_ja-JP_TELE.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url
  softwareName  = 'Microsoft Server Speech Recognition Language - TELE (ja-JP)'
  checksum      = 'B7D352051957A2162AAFA999DAA9549E3F87991D48B88F44D35EE732D2A6288B'
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @packageArgs
