Import-Module Get-ChildItemColor

$env:PYTHONIOENCODING = "utf-8"

# Remove-Item alias:ls -force
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

<# oh-my-posh #>
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Mars

<# Setting #>
# Set-PSReadlineKeyHandler -Key Tab -Function Complete

<# Alias #>
Set-Alias ll Get-ChildItem
Set-Alias which Get-Command

# With orang
if (Get-Command orang -errorAction SilentlyContinue) {
  function OrangFind {
    orang find -y l p=f @args
  }
  Set-Alias ff OrangFind
}

<# Functions #>
# Open the file explorer on current path
function exp { Invoke-Item . }

# Generate Guid
function guid {
  $output = New-Guid
  $output.Guid
}
Set-Alias uuid guid

<# Update all git submodules #>
function gsmp { git submodule foreach git pull }
