####################################################################################################
# This function copies a folder (and optionally, its subfolders)
#
# When copying subfolders it calls itself recursively
#
# Requires WebClient object $webClient defined, e.g. $webClient = New-Object System.Net.WebClient
#
# Parameters:
#   $source      - The url of folder to copy, with trailing /, e.g. http://website/folder/structure/
#   $destination - The folder to copy $source to, with trailing \ e.g. D:\CopyOfStructure\
#   $recursive   - True if subfolders of $source are also to be copied or False to ignore subfolders
#   Return       - None
#
# Usage:
#   Copy-Folder $source -destination $destination -recursive [0/1]
####################################################################################################
Function Copy-Folder([string]$source, [string]$destination, [bool]$recursive) {
    if (!$(Test-Path($destination))) {
        New-Item $destination -type directory -Force
    }

    $webClient = New-Object System.Net.WebClient
    # Get the file list from the web page
    $webString = $webClient.DownloadString($source)
    $lines = [Regex]::Split($webString, "<br>")
    # Parse each line, looking for files and folders
    foreach ($line in $lines) {
        if ($line.ToUpper().Contains("HREF")) {
            # File or Folder
            if (!$line.ToUpper().Contains("[TO PARENT DIRECTORY]")) {
                # Not Parent Folder entry
                $items = [Regex]::Split($line, """")
                $items = [Regex]::Split($items[2], "(>|<)")
                $item = $items[2]
                if ($line.ToLower().Contains("&lt;dir&gt")) {
                    # Folder
                    if ($recursive) {
                        # Subfolder copy required
                        Copy-Folder "$source$item/" "$destination$item/" $recursive
                    }
                    else {
                        # Subfolder copy not required
                    }
                }
                else {
                    # File
                    Write-Host "Downloading..." $source$item
                    try {
                        $webClient.DownloadFile("$source$item", "$destination$item")
                    }
                    catch [System.Net.WebException] {
                        if ($_.Exception.InnerException) {
                            Write-Error $_.Exception.InnerException.Message
                        }
                        else {
                            Write-Error $_.Exception.Message
                        }
                    }
                }
            }
        }
    }
}

$outputPath = (Get-Location).Path + "/output/"
$url = "http://cntsrftp.chinesegamer.net/tsr_test/1.0.0/LuaScripts/Lua/"
Copy-Folder $url -destination $outputPath -recursive 1
