<# this Group Policy can be used to increase the ScreenSaver TimeOut which can be sometimes
annoying #>

#Create the GPO
New-GPO -Name "ScreenSaverTimeOut" -Comment "Sets the time to 9000 seconds"

#Configure the GPO Screensaver Timeout
Set-GPRegistryValue -Name "ScreenSaverTimeOut" -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -ValueName ScreenSaveTimeOut -Type String -Value 9000

#Link the GPO to an Organizational Unit / Domain / Site
New-GPLink -Name "ScreenSaverTimeOut" -Target "ou=IT Computers,ou=IT,dc=example,dc=com"

#add the security filtering, uncomment if not needed
Set-GPPermission -Name "ScreenSaverTimeOut" -TargetName "wks-01" -TargetType Computer -PermissionLevel GPOApply