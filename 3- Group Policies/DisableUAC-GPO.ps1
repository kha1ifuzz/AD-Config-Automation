<# this Group Policy can be used to disable UAC in domain joined machines, 
which might be helpful in some security testings #>

#Create the GPO
New-GPO -Name "DisableUAC" -Comment "disable UAC"

#Configure the GPO
Set-GPRegistryValue -Name "DisableUAC" -Key "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName EnableLUA -Type DWord -Value 0
Set-GPRegistryValue -Name "DisableUAC" -Key "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName ConsentPromptBehaviorAdmin -Type DWord -Value 0

#Link the GPO to an Organizational Unit / Domain / Site
New-GPLink -Name "DisableUAC" -Target "ou=IT Computers,ou=IT,dc=example,dc=com"

#add the security filtering, uncomment if not needed
Set-GPPermission -Name "DisableUAC" -TargetName "wks-01" -TargetType Computer -PermissionLevel GPOApply