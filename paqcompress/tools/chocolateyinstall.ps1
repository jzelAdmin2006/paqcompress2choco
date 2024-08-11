$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = $env:ChocolateyPackageName
$zipUrl = 'https://github.com/moisespr123/PAQCompress/releases/download/v0.6.1/PAQCompress.v0.6.1.exe'

$packageArgs = @{
  PackageName   = $packageName
  Url           = $zipUrl
  Checksum      = '5C8E0F470EC2A0339504A2405F50D2A17DC005B6C2A5DFD27585DEBB4DE62777'
  ChecksumType  = 'sha256'
  UnzipLocation   = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
Remove-Item -force "$toolsDir\PAQCompress.v0.6.1.exe" -ea 0
Install-ChocolateyShortcut -ShortcutFilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PAQCompress.lnk' -TargetPath "$toolsDir\PAQCompress\PAQCompress.exe"
