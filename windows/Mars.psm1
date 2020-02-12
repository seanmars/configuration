#requires -Version 2 -Modules posh-git

function Write-Theme {
    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    $prompt += Write-Prompt -Object "$($sl.PromptSymbols.StartSymbol)" -ForegroundColor $sl.Colors.PromptUserBackgroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor
    $prompt += Write-Prompt -Object " $($sl.PromptSymbols.BeginLineTopSymbol)" -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor
    $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol) " -ForegroundColor $sl.Colors.PromptBackgroundColor -BackgroundColor $sl.Colors.PromptUserBackgroundColor

    $lastColor = $sl.Colors.PromptBackgroundColor
    #check for elevated prompt
    If (Test-Administrator) {
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.ElevatedSymbol)" -ForegroundColor $sl.Colors.AdminIconForegroundColor -BackgroundColor $sl.Colors.PromptUserBackgroundColor
    }


    $user = [System.Environment]::UserName
    $computer = [System.Environment]::MachineName
    $path = $pwd
    if (Test-NotDefaultUser($user)) {
        $prompt += Write-Prompt -Object "$user@$computer " -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $sl.Colors.PromptUserBackgroundColor
    }

    if (Test-VirtualEnv) {
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol)" -ForegroundColor $sl.Colors.SessionInfoBackgroundColor -BackgroundColor $sl.Colors.VirtualEnvBackgroundColor
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.VirtualEnvSymbol) $(Get-VirtualEnvName) " -ForegroundColor $sl.Colors.VirtualEnvForegroundColor -BackgroundColor $sl.Colors.VirtualEnvBackgroundColor
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol)" -ForegroundColor $sl.Colors.VirtualEnvBackgroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor
    }
    else {
        $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol)" -ForegroundColor $sl.Colors.PromptUserBackgroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor
    }

    # Writes the drive portion
    $prompt += Write-Prompt -Object " $path " -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor

    $status = Get-VCSStatus
    if ($status) {
        $themeInfo = Get-VcsInfo -status ($status)
        $lastColor = $themeInfo.BackgroundColor
        $prompt += Write-Prompt -Object $($sl.PromptSymbols.SegmentForwardSymbol) -ForegroundColor $sl.Colors.PromptBackgroundColor -BackgroundColor $lastColor
        $prompt += Write-Prompt -Object " $($themeInfo.VcInfo) " -BackgroundColor $lastColor -ForegroundColor $sl.Colors.GitForegroundColor
    }

    # Writes the postfix to the prompt
    $prompt += Write-Prompt -Object $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $lastColor

    #check the last command state and indicate if failed
    If ($lastCommandFailed) {
        $prompt += Write-Prompt -Object " $($sl.PromptSymbols.FailedCommandSymbol)" -ForegroundColor $sl.Colors.CommandFailedIconForegroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
    }
    else {
        $prompt += Write-Prompt -Object " $($sl.PromptSymbols.SuccessCommandSymbol)" -ForegroundColor $sl.Colors.CommandSuccessIconForegroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
    }

    # $timeStamp = Get-Date -UFormat %T
    # $timestamp = " $timeStamp "
    # $prompt += Set-CursorForRightBlockWrite -textLength ($timestamp.Length + $sl.PromptSymbols.TimeSymbol.Length + $sl.PromptSymbols.SegmentBackwardSymbol.Length + $sl.PromptSymbols.SegmentForwardSymbol.Length + 1)
    # $prompt += Write-Prompt $sl.PromptSymbols.SegmentBackwardSymbol -ForegroundColor $sl.Colors.PromptBackgroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor
    # $prompt += Write-Prompt $sl.PromptSymbols.TimeSymbol -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor
    # $prompt += Write-Prompt $timeStamp -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor
    # $prompt += Write-Prompt $sl.PromptSymbols.SegmentForwardSymbol -ForegroundColor $sl.Colors.PromptBackgroundColor -BackgroundColor $sl.Colors.SessionInfoBackgroundColor

    $prompt += Set-Newline

    if ($with) {
        $prompt += Write-Prompt -Object "$($with.ToUpper()) " -BackgroundColor $sl.Colors.WithBackgroundColor -ForegroundColor $sl.Colors.WithForegroundColor
    }

    # Bottom begin
    $prompt += Write-Prompt -Object "$($sl.PromptSymbols.StartSymbol)" -ForegroundColor $sl.Colors.PromptUserBackgroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor
    $prompt += Write-Prompt -Object " $($sl.PromptSymbols.BeginLineBottomSymbol)" -ForegroundColor $sl.Colors.PromptForegroundColor -BackgroundColor $sl.Colors.PromptBackgroundColor
    $prompt += Write-Prompt -Object $sl.PromptSymbols.PromptIndicator -ForegroundColor $sl.Colors.PromptIndicatorForegroundColor1 -BackgroundColor $sl.Colors.PromptBackgroundColor
    $prompt += Write-Prompt -Object $sl.PromptSymbols.PromptIndicator -ForegroundColor $sl.Colors.PromptIndicatorForegroundColor2 -BackgroundColor $sl.Colors.PromptBackgroundColor
    $prompt += Write-Prompt -Object $sl.PromptSymbols.PromptIndicator -ForegroundColor $sl.Colors.PromptIndicatorForegroundColor3 -BackgroundColor $sl.Colors.PromptBackgroundColor
    $prompt += Write-Prompt -Object "$($sl.PromptSymbols.SegmentForwardSymbol) " -ForegroundColor $sl.Colors.PromptBackgroundColor -BackgroundColor $sl.Colors.PromptUserBackgroundColor

    $prompt += ' '
    $prompt
}

$sl = $global:ThemeSettings #local settings

$sl.PromptSymbols.BeginLineTopSymbol = "┌"
$sl.PromptSymbols.BeginLineBottomSymbol = "└"

$sl.PromptSymbols.StartSymbol = [char]::ConvertFromUtf32(0xe0c6)
$sl.PromptSymbols.PromptIndicator = [char]::ConvertFromUtf32(0xf105)
$sl.PromptSymbols.SegmentForwardSymbol = [char]::ConvertFromUtf32(0xe0c6)
$sl.PromptSymbols.SegmentBackwardSymbol = [char]::ConvertFromUtf32(0xE0B2)
$sl.PromptSymbols.TimeSymbol = ' ' + [char]::ConvertFromUtf32(0x235F)
$sl.PromptSymbols.FailedCommandSymbol = [char]::ConvertFromUtf32(0x2718)
$sl.PromptSymbols.SuccessCommandSymbol = [char]::ConvertFromUtf32(0x2714)

$sl.Colors.PromptForegroundColor = [ConsoleColor]::White
$sl.Colors.PromptBackgroundColor = [ConsoleColor]::DarkBlue
$sl.Colors.PromptSymbolColor = [ConsoleColor]::White
$sl.Colors.PromptHighlightColor = [ConsoleColor]::DarkBlue
$sl.Colors.GitForegroundColor = [ConsoleColor]::Black
$sl.Colors.WithForegroundColor = [ConsoleColor]::DarkRed
$sl.Colors.WithBackgroundColor = [ConsoleColor]::DarkMagenta
$sl.Colors.VirtualEnvBackgroundColor = [System.ConsoleColor]::DarkRed
$sl.Colors.VirtualEnvForegroundColor = [System.ConsoleColor]::White
$sl.Colors.CommandSuccessIconForegroundColor = [System.ConsoleColor]::DarkGreen
$sl.Colors.CommandFailedIconForegroundColor = [System.ConsoleColor]::DarkRed
$sl.Colors.PromptIndicatorForegroundColor1 = [ConsoleColor]::White
$sl.Colors.PromptIndicatorForegroundColor2 = [ConsoleColor]::Green
$sl.Colors.PromptIndicatorForegroundColor3 = [ConsoleColor]::Yellow
$sl.Colors.PromptUserBackgroundColor = [ConsoleColor]::Black
