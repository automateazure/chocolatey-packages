
$ErrorActionPreference = 'Stop';


$packageName= 'PowershellGallery'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/C/4/1/C41378D4-7F41-4BBE-9D0D-0E4F98585C61/PackageManagement_x86.msi'
$url64      = 'https://download.microsoft.com/download/C/4/1/C41378D4-7F41-4BBE-9D0D-0E4F98585C61/PackageManagement_x64.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  silentArgs    = "/quiet /norestart ACCEPTEULA=1"
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'PowershellGallery*'
  checksum      = 'B0307061189F0BCE8414A0BE116E8B73'
  checksumType  = 'md5' #default is md5, can also be sha1
  checksum64    = 'EB9BFD73B0F07D002910D229170FC022'
  checksumType64= 'md5' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
