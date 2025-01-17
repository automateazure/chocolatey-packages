import-module au


$GitHubRepositoryUrl = 'https://github.com/git-for-windows/git/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]fileName32\s*=\s*)('.*')" = "`$1'$($Latest.FileName32)'"
            "(^[$]fileName64\s*=\s*)('.*')" = "`$1'$($Latest.FileName64)'"
        }

        ".\legal\verification.txt" = @{
            "(?i)(32-Bit.+)\<.*\>" = "`${1}<$($Latest.URL32)>"
            "(?i)(64-Bit.+)\<.*\>" = "`${1}<$($Latest.URL64)>"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType)"
            "(?i)(checksum32:\s+).*" = "`${1}$($Latest.Checksum32)"
            "(?i)(checksum64:\s+).*" = "`${1}$($Latest.Checksum64)"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    #https://github.com/git-for-windows/git/releases/download/v2.11.0.windows.1/Git-2.11.0-32-bit.exe
    $re32  = "Git-.+-32-bit.exe"
    $url32 = $download_page.links | Where-Object href -match $re32 | Select-Object -First 1 -expand href | % { $domain + $_ }

    #https://github.com/git-for-windows/git/releases/download/v2.11.0.windows.1/Git-2.11.0-64-bit.exe
    $re64  = "Git-.+-64-bit.exe"
    $url64 = $download_page.links | Where-Object href -match $re64 | Select-Object -First 1 -expand href | % { $domain + $_ }

    $version32 = $url32 -split '-' | Select-Object -Skip 2 -Last 1
    $version64 = $url64 -split '-' | Select-Object -Skip 2 -Last 1
    if ($version32 -ne $version64) {  throw "Different versions for 32-Bit and 64-Bit detected." }

    @{
        Version = $version32
        URL32   = $url32
        URL64   = $url64
        ReleaseNotes = "$GitHubRepositoryUrl/releases/tag/$version"
    }
}


    update -ChecksumFor none
