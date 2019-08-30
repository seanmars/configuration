New-Alias ll Get-ChildItem
New-Alias which Get-Command

<# Simulate the touch command in Unix-like operating systems #>
function touch { if((Test-Path -Path ($args[0])) -eq $false) { set-content -Path ($args[0]) -Value ($null) } }

<# Update all git submodules #>
function smp { git submodule foreach git pull }
