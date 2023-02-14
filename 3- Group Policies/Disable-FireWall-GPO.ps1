<# this Group Policy can be used to disable windows FW in domain joined machines which might be helpful
in some security testings #>

#Create the GPO
New-GPO -Name "DisableFW" -Comment "disable FW profiles and turn them off"

#Configure the GPO
Set-GPRegistryValue -Name "DisableFW" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" -ValueName EnableFirewall -Type DWord -Value 0
Set-GPRegistryValue -Name "DisableFW" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile" -ValueName EnableFirewall -Type DWord -Value 0
Set-GPRegistryValue -Name "DisableFW" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile" -ValueName EnableFirewall -Type DWord -Value 0
Set-GPRegistryValue -Name "DisableFW" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall" -ValueName PolicyVersion -Type DWord -Value 541

#Link the GPO to an Organizational Unit / Domain / Site
New-GPLink -Name "DisableFW" -Target "ou=IT Computers,ou=IT,dc=example,dc=com"

#security filtering, if you want to apply it to only certain machines.
Set-GPPermission -Name "DisableFW" -TargetName "wks-01" -TargetType Computer -PermissionLevel GPOApply