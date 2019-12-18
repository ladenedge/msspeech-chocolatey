$ErrorActionPreference = 'Stop'; # stop on all errors

$url        = 'https://download.microsoft.com/download/A/6/4/A64012D6-D56F-4E58-85E3-531E56ABC0E6/x86_SpeechPlatformRuntime/SpeechPlatformRuntime.msi'
$url64      = 'https://download.microsoft.com/download/A/6/4/A64012D6-D56F-4E58-85E3-531E56ABC0E6/x64_SpeechPlatformRuntime/SpeechPlatformRuntime.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64
  softwareName  = 'Microsoft Server Speech Platform Runtime*'
  checksum      = '9B42EEC0DB1DC3CB92FCDD795EA0771EDAC1CF58118D12A810810268ADB954B4'
  checksumType  = 'sha256'
  checksum64    = '9C0A1D096E80F2AE77D5FC00B5D1A43B665C28EC6196911DE3DCE6D74C115137'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
