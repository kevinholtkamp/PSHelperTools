$APIKey = Read-Host "Enter API Key"


New-Item "./Publishing/PSHelperTools" -ItemType Directory -Force | Out-Null

Copy-Item ./PSHelperTools.psd1 ./Publishing/PSHelperTools/PSHelperTools.psd1 | Out-Null
Copy-Item ./PSHelperTools.psm1 ./Publishing/PSHelperTools/PSHelperTools.psm1 | Out-Null

Publish-Module -Path ./Publishing/PSHelperTools -Repository "CustomRepository" -ErrorAction "continue" -NuGetApiKey $APIKey
#Publish-Module -Path ./Publishing/PSHelperTools -Repository "PSGallery" -ErrorAction "continue" -NuGetApiKey $APIKey

#[version]$version = (Import-PowerShellDataFile ./PSHelperTools.psd1).ModuleVersion
#[version]$NewVersion = "{0}.{1}.{2}" -f $Version.Major, $Version.Minor, ($Version.Build + 1)
#Update-ModuleManifest -Path ./PSHelperTools.psd1 -ModuleVersion $NewVersion

Remove-Item "./Publishing" -Recurse -Force


Write-Host "Done" -ForegroundColor Green