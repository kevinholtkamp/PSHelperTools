function New-TestEnvironment(){
    Set-Location $env:temp
    $Folder = -join ((65..90) + (97..122) | Get-Random -Count 20 | % {[char]$_})
    New-Item $Folder -ItemType Directory
    Set-Location $Folder
}
