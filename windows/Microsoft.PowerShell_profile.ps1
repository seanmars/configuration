<# %UserProfile%/Documents/PowerShell/ #>

Import-Module Get-ChildItemColor

$env:PYTHONIOENCODING="utf-8"

# Remove-Item alias:ls -force
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

<# oh-my-posh #>
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Mars

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

# Generate Guid
function guid
{
  $output = New-Guid
  $output.Guid
}
New-Alias uuid guid

<# Git command #>
# Update all git submodules
function gsmp { git submodule foreach git pull }
