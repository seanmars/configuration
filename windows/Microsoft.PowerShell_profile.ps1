<# %UserProfile%/Documents/PowerShell/ #>

<# Setting #>
Set-PSReadlineKeyHandler -Key Tab -Function Complete

<# Alias #>
New-Alias ll Get-ChildItem
New-Alias which Get-Command

<# Functions #>
# Open the file explorer on current path
function exp { Invoke-Item . }

# Simulate the touch command in Unix-like operating systems
function touch { if((Test-Path -Path ($args[0])) -eq $false) { set-content -Path ($args[0]) -Value ($null) } }

# Git command: Update all git submodules
function smp { git submodule foreach git pull }
