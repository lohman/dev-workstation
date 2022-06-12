param(
# Define parameters and values
[bool]$newDisableGpu=$true,
[string]$desktopConfigFile=“$env:userprofile\\AppData\Roaming\Microsoft\Teams\desktop-config.json”,
[string]$cookieFile="$env:userprofile\\AppData\Roaming\Microsoft\teams\Cookies",
[string]$registryPath="HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
[string]$registryDisplayName="Microsoft Teams",
[string]$processName="Teams"
)

$registryPathCheck = Get-ChildItem -Path $registryPath -Recurse | Get-ItemProperty | Where-Object {$_.DisplayName -eq $registryDisplayName } -ErrorAction SilentlyContinue
$processCheck = Get-Process $processName -ErrorAction SilentlyContinue
$config = (Get-Content -Path $desktopConfigFile | ConvertFrom-Json -ErrorAction SilentlyContinue)
$configCheck = $config | where {($_.currentWebLanguage -ne $newWebLanguage) -or ($_.appPreferenceSettings.disableGpu -ne $newDisableGpu)} -ErrorAction SilentlyContinue
$cookieFileCheck = Get-Item -path $cookieFile -ErrorAction SilentlyContinue

if ($registryPathCheck -and $configCheck -and $processCheck)
{
    Get-Process $processName | Stop-Process -Force
    Start-Sleep 5
}

$processCheckFinal = Get-Process $processName -ErrorAction SilentlyContinue

if ($registryPathCheck -and $configCheck)
{
    $config.appPreferenceSettings.disableGpu=$newDisableGpu
    $config | ConvertTo-Json -Compress | Set-Content -Path $desktopConfigFile -Force


    if (!$processCheckFinal -and $cookieFileCheck)
    {
        Remove-Item -path $cookieFile -Force
    }
}
