# Set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Use $env:USERPROFILE to dynamically reference the user's home directory
$omp_config = "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes\huvix.omp.json"
oh-my-posh init pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine Configuration
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf Configuration
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Environment Variable
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Aliases
Set-Alias -Name vim -Value nvim
Set-Alias -Name ll -Value ls
Set-Alias -Name g -Value git
Set-Alias -Name grep -Value findstr
Set-Alias -Name tig -Value 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias -Name less -Value 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
