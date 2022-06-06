New-Item "./Publishing/PSHelperTools" -ItemType Directory -Force

Copy-Item ./PSHelperTools.psd1 ./Publishing/PSHelperTools/PSHelperTools.psd1
Copy-Item ./PSHelperTools.psm1 ./Publishing/PSHelperTools/PSHelperTools.psm1

Publish-Module -Path ./Publishing/PSHelperTools -Repository "CustomRepository" -ErrorAction "continue"
Publish-Module -Path ./Publishing/PSHelperTools -Repository "PSGallery" -ErrorAction "continue"

[version]$version = (Import-PowerShellDataFile ./PSHelperTools.psd1).ModuleVersion
[version]$NewVersion = "{0}.{1}.{2}" -f $Version.Major, $Version.Minor, ($Version.Build + 1)
Update-ModuleManifest -Path ./PSHelperTools.psd1 -ModuleVersion $NewVersion

Remove-Item "./Publishing" -Recurse -Force