$ErrorActionPreference = 'Stop'

$packageArgs = @{
   packageName    = $env:ChocolateyPackageName
   url            = 'https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup.exe'
   url64bit       = 'https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup_x64.exe'
   checksum       = '7C8786BA02CEDF78BC27C4A5024418C9F857670D57E185C57EF7F3FD6572A02E'
   checksumType   = 'SHA256'
   checksum64     = 'B6A8A11140D97F315E80DE0161F75DD493604EFAE3E1A4400B69A385340BE64C'
   fileType       = 'EXE'
   silentArgs     = "-quiet -norestart ACCEPT_EULA=1 -log `"$env:TEMP\$env:ChocolateyPackageName.$env:chocolateyPackageVersion.Install.log`""
   validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
