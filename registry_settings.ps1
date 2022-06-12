
Set-ErrorAction SilentlyContinue
# Fix the web-version of teams from looping when third-party cookies are blocked
Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "1" -value "[*.]microsoft.com"
Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "1" -value "[*.]microsoftonline.com"
Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "1" -value "[*.]teams.skype.com"
Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "1" -value "[*.]teams.microsoft.com"
Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "1" -value "[*.]sfbassets.com"
Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "1" -value "[*.]skypeforbusiness.com"

# Cleanup Peraton Image setting the Lens as the default page for every tab
Remove-ItemProperty -path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "HomepageLocation"
Remove-ItemProperty -path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "NewTabPageLocation"
Remove-ItemProperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "HomepageLocation"
Remove-ItemProperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Name "NewTabPageLocation" 
Remove-ItemProperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Edge\Recommended" -Name "HomepageLocation"
Remove-ItemProperty -path "HKLM:\\SOFTWARE\Policies\Mozilla\Firefox\Homepage" -Name "URL"

# Set network connection profile to Private for the firewall
Set-NetConnectionProfile -InterfaceAlias Ethernet -NetworkCategory Private
