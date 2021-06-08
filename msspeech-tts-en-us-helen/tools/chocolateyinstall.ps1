$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$baseDir = $toolsDir | Split-Path

# online version: https://chocolatey.org/packages/msspeech-tts-en-us-helen
# public github repo: https://github.com/ladenedge/msspeech-chocolatey

. $toolsDir/Test-IsInstalled.ps1

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  file          = Join-Path $baseDir 'MSSpeech_TTS_en-US_Helen.msi'
  softwareName  = 'Microsoft Server Speech Text to Speech Voice (en-US, Helen)'
  checksum      = 'B8F2F9995BB64FAF9B1DA855A22053E05CF3350BC4F4B54E940B79F80B0F2A41'
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641, 1603)
}

if (-not (Test-IsInstalled -NameLike $packageArgs.softwareName)) {
    Install-ChocolateyPackage @packageArgs
}
