<#
.SYNOPSIS
  Install and maintain apps on the target Windows desktop
.DESCRIPTION
  Install and maintain apps on the target Windows desktop
.PARAMETER <Parameter_Name>
    none
.INPUTS
  run a choco search on your desktop for the app name then copy it in to this script
.OUTPUTS
  console
.NOTES
  Version:        .01
  Author:         Christopher Lohman
  Creation Date:  2022-05-07
  Purpose/Change: Initial script development
  
#>

$APPS = @(
'googlechrome'
'notepadplusplus'
'git'
'7zip'
'vscode'
'zoom'
'docker-desktop'
'vcxsrv'
'sysinternals'
'wireshark'
'greenshot'
'lxrunoffline'
'signal'
'pingplotter'

)

If(Test-Path -Path "$env:ProgramData\Chocolatey") {
  # DoYourPackageInstallStuff
  ForEach ($app in $APPS)
    {
      Write-Output "################################################################################"
      Write-Output "########## $app"
      Write-Output "################################################################################"
      choco upgrade -y $app
    }
}
Else {
  # InstallChoco
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))      

  # DoYourPackageInstallStuff
  ForEach ($app in $APPS)
    {
      Write-Output "################################################################################"
      Write-Output "########## $app"
      Write-Output "################################################################################"
      choco upgrade -y $app
    }
}

wsl --install

#License keys for the stuff above

##Ping Plotter Serial

Set-Itemproperty -path "HKLM:\Software\Pingman Tools\PingPlotter\User" -Name "UserName" -value "Christopher Lohman"
Set-Itemproperty -path "HKLM:\Software\Pingman Tools\PingPlotter\User" -Name "RegistrationCode" -value "5FRT-2UXE-QFKN-MH57"
