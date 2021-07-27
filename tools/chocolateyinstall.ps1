$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/flameshot-org/flameshot/releases/download/v0.9.0/Flameshot-0.9.0-win64.msi'
$url64      = 'https://github.com/flameshot-org/flameshot/releases/download/v0.9.0/Flameshot-0.9.0-win64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Flameshot*'

  checksum      = '64C0381189BF0434FB7D1E10E5B14E4AE8D1ED0A12F125464B6E51BCA3AE5205'
  checksumType  = 'sha256'
  checksum64    = '64C0381189BF0434FB7D1E10E5B14E4AE8D1ED0A12F125464B6E51BCA3AE5205'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
